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
        hover_markup_content = RorLsp::HoverMarkupContent::Base.new(target_message).call
        @writer.write(id: @request[:id], result: hover_markup_content)
      end
    end

    private

    def retrieve_target_message(uri, position)
      document = File.binread(CGI.unescape(URI.parse(uri).path))
      tree = SyntaxTree.parse(document)
      new_position = find_position(document, position)

      target, _ = locate_node_and_parent(
        tree, [SyntaxTree::Command, SyntaxTree::VCall], new_position
      )

      case target
      when SyntaxTree::Command
        target.message.value
      when SyntaxTree::VCall
        target.value.value
      end
    end

    def locate_node_and_parent(parent, target_nodes, position)
      matched = parent.child_nodes.compact.bsearch do |child|
        if (child.location.start_char...child.location.end_char).cover?(position)
          0
        else
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

      until @current_line == position[:line]
        @pos += 1 until /\R/.match?(@source[@pos])
        @pos += 1
        @current_line += 1
      end

      @pos + position[:character]
    end
  end
end
