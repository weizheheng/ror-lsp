# frozen_string_literal: true

module RorLsp::MarkupContent
  class Rails::ActiveSupport
    class << self
      def assert_difference
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "assert_difference(expression, *args, &block)",
            "```",
            "**Example usage:**",
            "```ruby",
            "assert_difference 'Article.count', 1 do",
            "\tpost articles_path, params: { article; {...} }",
            "end",
            "",
            "assert_difference 'Article.count', -1 do",
            "\tdelete articles_path, params: { article; {...} }",
            "end",
            "```",
            "**Documentation:**",
            "Test numeric difference between the return value of an expression as a result of what",
            "is evaluated in the yielded block."
          ].join("\n")
        )
      end
    end
  end
end
