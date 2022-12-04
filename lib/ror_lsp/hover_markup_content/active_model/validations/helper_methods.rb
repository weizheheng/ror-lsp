# frozen_string_literal: true

module RorLsp::HoverMarkupContent
  class ActiveModel::Validations::HelperMethods
    class << self
      def validates_presence_of
        contents = LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "validates_presence_of(*attr_names)",
            "```",
            "```ruby",
            "# Example usage:",
            "class User < ActiveRecord::Base",
            "\tvalidates_presence_of :first_name",
            "end",
            "```",
            "**Configuration options:**",
            "* `:message` - A custom error message (default is: \"can't be blank\")",
            "* Default options: `:if`, `:unless`, `:on`, `:allow_nil`, `:allow_blank`, and `:strict`",
            "---",
            "**NOTE**:",
            "* If you want to validate the presence of a boolean field, you will want to use:",
            "\t* `validates_inclusion_of :field_name, in: [true, false]`"
          ].join("\n")
        )
        LanguageServer::Protocol::Interface::Hover.new(
          contents: contents
        )
      end
    end
  end
end
