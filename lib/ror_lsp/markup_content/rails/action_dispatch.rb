# frozen_string_literal: true

module RorLsp::MarkupContent
  class Rails::ActionDispatch
    class << self
      def assert_response
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "assert_response(type, message = nil)",
            "```",
            "**Example usage:**",
            "```ruby",
            "assert_response :success",
            "assert_response :redirect\n",
            "# You can also pass an explicit status number or its symbolic equivalent",
            "assert_response :unprocessable_entity",
            "assert_response 401\n",
            "```",
            "**Documentation:**",
            "Asserts that the response is one of the following types:",
            "- `:success` - Status code was in the 200-299 range",
            "- `:redirect` - Status code was in the 300-399 range",
            "- `:missing` - Status code was 404",
            "- `:error` - Status code was in the 500-599 range\n"
          ].join("\n")
        )
      end

      def assert_redirected_to
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "assert_redirected_to(url_options = {}, options ={}, message: nil)",
            "```",
            "**Example usage:**",
            "```ruby",
            "assert_redirected_to controller: 'weblog', action: 'index'",
            "assert_redirected_to login_url",
            "assert_redirected_to @customer",
            "assert_redirected_to %r(\\Ahttp://example.org)",
            "assert_redirected_to '/some/path', status: :moved_permanently",
            "```",
            "**Documentation:**",
            "Asserts that the response is a redirect to a URL matching the given options"
          ].join("\n")
        )
      end

      def follow_redirect!
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "follow_redirect!(headers: {}, **args)",
            "```",
            "**Documentation:**",
            "Follow a single redirect response. If the last response was not a redirect, an exception will be raised.",
            "Otherwise, the redirect is performed on the location header. If the redirect is a 307 or 308 redirect,",
            "the same HTTP verb will be used when redirecting, otherwise a GET request will be performed.",
            "Any arguments are passed to the underlying request.\n",
            "The `HTTP_REFERER` header will be set to the previous url."
          ].join("\n")
        )
      end
    end
  end
end
