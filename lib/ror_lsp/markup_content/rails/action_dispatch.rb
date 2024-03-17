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
            "---",
            "**Example usage:**",
            "```ruby",
            "assert_response :success",
            "assert_response :redirect\n",
            "# You can also pass an explicit status number or its symbolic equivalent",
            "assert_response :unprocessable_entity",
            "assert_response 401\n",
            "```",
            "---",
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
            "---",
            "**Example usage:**",
            "```ruby",
            "assert_redirected_to controller: 'weblog', action: 'index'",
            "assert_redirected_to login_url",
            "assert_redirected_to @customer",
            "assert_redirected_to %r(\\Ahttp://example.org)",
            "assert_redirected_to '/some/path', status: :moved_permanently",
            "```",
            "---",
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
            "---",
            "**Documentation:**",
            "Follow a single redirect response. If the last response was not a redirect, an exception will be raised.",
            "Otherwise, the redirect is performed on the location header. If the redirect is a 307 or 308 redirect,",
            "the same HTTP verb will be used when redirecting, otherwise a GET request will be performed.",
            "Any arguments are passed to the underlying request.\n",
            "The `HTTP_REFERER` header will be set to the previous url."
          ].join("\n")
        )
      end

      def flash
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "flash()",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "flash[:notice] = \"Notice message\"",
            "flash.notice = \"Notice message\"",
            "flash[:alert] = \"Alert message\"",
            "flash.alert = \"Alert message\"",
            "# Sets a flash that will not be available to the next action, only to the current",
            "flash.now[:alert] = \"Alert message\"",
            "```",
            "---",
            "**Documentation:**",
            "Access the contents of the flash. Returns a `ActionDispatch::Flash::FlashHash`"
          ].join("\n")
        )
      end

      def cookies
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "cookies",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "# Sets a simple session cookie.",
            "# This cookie will be deleted when the user's browser is closed.",
            "cookies[:user_name] = \"david\"",
            "",
            "# Cookie values are String-based. Other data types need to be serialized.",
            "cookies[:lat_lon] = JSON.generate([47.68, -122.37])",
            "",
            "# Sets a cookie that expires in 1 hour.",
            "cookies[:login] = { value: \"XJ-122\", expires: 1.hour }",
            "",
            "# Sets a cookie that expires at a specific time.",
            "cookies[:login] = { value: \"XJ-122\", expires: Time.utc(2020, 10, 15, 5) }",
            "",
            "# Sets a signed cookie, which prevents users from tampering with its value.",
            "# It can be read using the signed method `cookies.signed[:name]`",
            "cookies.signed[:user_id] = current_user.id",
            "",
            "# Sets an encrypted cookie value before sending it to the client which",
            "# prevent users from reading and tampering with its value.",
            "# It can be read using the encrypted method `cookies.encrypted[:name]`",
            "cookies.encrypted[:discount] = 45",
            "",
            "# Sets a \"permanent\" cookie (which expires in 20 years from now).",
            "cookies.permanent[:login] = \"XJ-122\"",
            "",
            "# You can also chain these methods:",
            "cookies.signed.permanent[:login] = \"XJ-122\"",
            "",
            "# READING COOKIES",
            "cookies[:user_name]",
            "cookies.signed[:login]",
            "cookies.encrypted[:discount]",
            "",
            "# DELETING COOKIES",
            "cookies.delete(:user_name)",
            "```",
            "---",
            "**Documentation:**",
            "* Read and write data to cookies through `ActionController::Cookies#cookies`.",
            "* When reading cookie data, the data is read from the HTTP request header, Cookie.",
            "* When writing cookie data, the data is sent out in the HTTP response header, `Set-Cookie`",
            "",
            "Options:",
            "- `:value`: The cookie's value",
            "- `:path`: The path for which this cookie applies. Defaults to the root of the application.",
            "- `:domain`: The domain for which this cookie applies so you can restrict to the domain level.",
            "- `:expires`: The time at which this cookie expires, as a Time or `ActiveSupport::Duration` object.",
            "- `:secure`: Whether this cookie is only transmitted to HTTPS servers. Default is `false`.",
            "- `:httponly`: Whether this cookie is accessible via scripting or only HTTP. Defaults to `false`.",
            "- `:same_site`: The value of the SameSite cookie attribute",
            "\t\twhich determines how this cookie should be restricted in cross-site contexts.",
            "\t\tPossible values are `nil`, `:none`, `:lax`, and `:strict`. Defaults to `:lax`"
          ].join("\n")
        )
      end

      def session
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "reset_session()",
            "```",
            "---",
            "**Example Usage:**",
            "```ruby",
            "session[:current_user_id] = user.id",
            "```",
            "---",
            "**Documentation:**",
            "* The `ActionDispatch::Request::Session` instance for the current request.",
            "* Your application has a session for each user in which you can store small amounts of data.",
            "* Those data will be persisted across requests.",
            "* The session is only available in the controller and the view.",
            "* Can use one of several of different storage mechanisms (default to CookieStore)"
          ].join("\n")
        )
      end

      def reset_session
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "reset_session()",
            "```",
            "---",
            "**Documentation:**",
            "```ruby",
            "def reset_session",
            "\tsession.destroy",
            "\treset_csrf_token",
            "end",
            "```",
          ].join("\n")
        )
      end
    end
  end
end
