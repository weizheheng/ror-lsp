# frozen_string_literal: true

module RorLsp
  class CompletionItem
    def initialize(options, documentation_list)
      @label = options[:label]
      @kind = options[:kind]
      @insert_text_format = options[:insert_text_format]
      @insert_text = options[:insert_text]
      @documentation_list = documentation_list
    end

    def call
      LSP::Interface::CompletionItem.new(
        label: @label,
        kind: @kind,
        detail: "",
        insert_text_format: @insert_text_format,
        insert_text: @insert_text,
        documentation: documentation
      )
    end

    private

    def documentation
      @documentation_list[@label.to_sym]&.call
    end
  end
end
