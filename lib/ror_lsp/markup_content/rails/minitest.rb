module RorLsp::MarkupContent
  class Rails::Minitest
    class << self
      def assert_equal
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Minitest]",
            "assert_equal(expected, actual, message  = nil)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "assert_equal(\"test@gmail.com\", user.email)",
            "```",
            "---",
            "**Documentation:**",
            "Fails unless expected == actual printing the difference between the two, if possbile"
          ].join("\n")
        )
      end

      def assert_match
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Minitest]",
            "assert_match(matcher, object, message  = nil)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "assert_match([\"test@gmail.com\"], mail.from)",
            "```",
            "---",
            "**Documentation:**",
            "Fails unless matcher =~ objecter"
          ].join("\n")
        )
      end

      def assert_nil
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Minitest]",
            "assert_nil(object, message = nil)",
            "```",
            "---",
            "**Documentation:**",
            "Fails unless `object` is nil"
          ].join("\n")
        )
      end

      def assert_not_nil
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "assert_not_nil(object, message = nil)",
            "```",
            "---",
            "**Documentation:**",
            "- Alias for: `refute_nil`",
            "- Fails if `object` is nil"
          ].join("\n")
        )
      end

      def assert_template
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails Controller Testing]",
            "assert_template(options = {}, message = nil)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "# assert that the users/new view template was rendered",
            "assert_template \"users/new\"",
            "",
            "# assert that the layout 'admin' was rendered",
            "assert_template layout: 'admin'",
            "",
            "# assert that the \"_customer\" partial was rendered twice",
            "assert_template partial: '_customer', count: 2",
            "",
            "# assert that no partials/file was rendered",
            "assert_template partial: false",
            "assert_template file: false",
            "```",
            "---",
            "**Documentation:**",
            "- Asserts that the request was rendered with the appropriate template file or partials"
          ].join("\n")
        )
      end
    end
  end
end
