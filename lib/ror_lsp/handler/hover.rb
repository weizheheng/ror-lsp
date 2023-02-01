# frozen_string_literal: true

require "syntax_tree"
require "cgi"
require "uri"

module RorLsp::Handler
  class Hover
    def initialize(request, writer)
      @request = request
      @writer = writer
    end

    def call
      position = @request.dig(:params, :position)

      uri = @request.dig(:params, :textDocument, :uri)
      target_message = retrieve_target_message(uri, position)

      if target_message.nil?
        @writer.write(id: @request[:id], result: nil)
      else
        hover_markup_content =
          RorLsp::HoverMarkupContent.new(target_message).call
        @writer.write(id: @request[:id], result: hover_markup_content)
      end
    end

    private

    def retrieve_target_message(uri, position)
      document = File.binread(CGI.unescape(URI.parse(uri).path))
      tree = SyntaxTree.parse(document)
      new_position = find_position(document, position)

      target, _ =
        locate_node_and_parent(tree, [SyntaxTree::Ident], new_position)

      case target
      when SyntaxTree::Ident
        target.value
      end
    end

    def locate_node_and_parent(parent, target_nodes, position)
      matched =
        parent.child_nodes.compact.bsearch do |child|
          # ... is exclusing the end
          if (child.location.start_char...child.location.end_char).cover?(
            position
          )
            0
          else
            # a <=> b
            # return -1 if a < b
            # return 0 if a = b
            # return 1 if a > b
            position <=> child.location.start_char
          end
        end

      case matched
      when *target_nodes
        [matched, parent]
      when SyntaxTree::Node
        locate_node_and_parent(matched, target_nodes, position)
      else
        []
      end
    end

    def find_position(source, position)
      @current_line = 0
      @pos = 0
      @source = source

      # Character is zero index
      # Line is also zero index
      # We also need to take into account of new line or carriage return
      # Eg:
      # 1 + 1
      # 2 + 2
      #
      # Syntax tree perspective is from the range of the cursor line
      # Zero index as well
      # 1 + 1
      # |1| |+| |1|
      # | is the cursor line
      # start_char = 0
      # end_char = 5
      #
      # Ruby example
      # class Test
      #   something
      # end
      #
      # First line the last character is position 9
      # Then we need to add 1 for new line become 10
      # Then we need to add 1 as we move to the first char at new line become 11
      # Thereforme `s` of the something is at char 13
      until @current_line == position[:line]
        @pos += 1 until /\R/.match?(@source[@pos])
        @pos += 1
        @current_line += 1
      end

      @pos + position[:character]
    end
  end
end
