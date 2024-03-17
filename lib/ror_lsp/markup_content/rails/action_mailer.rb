module RorLsp::MarkupContent
  class Rails::ActionMailer
    class << self
      def assert_enqueued_email_with
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "assert_enqueued_email_with(mailer, method, params: nil, args: nil, queue: nil, &block)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "def test_email",
            "\tContactMailer.welcome.deliver_later",
            "\tassert_enqueued_email_with(ContactMailer, :welcome)",
            "end",
            "",
            "def test_email_in_block",
            "\tassert_enqueued_email_with(ContactMailer, :welcome, params: { user: @user }) do",
            "\t\tContactMailer.with(user: user).welcome.deliver_later",
            "\tend",
            "end",
            "```",
            "---",
            "**Documentation:**",
            "Asserts that specific email has been enqueued, optionally matching arguments and/or params"
          ].join("\n")
        )
      end

      def mail
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "mail(headers = {}, &block)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class Notifier < ActionMailer::Base",
            "\tdefault from: \"no-reply@example.com\"",
            "\tdef welcome",
            "\t\t# Look for all templates at \"app/views/notifier\" with name \"welcome\"",
            "\t\tmail(to: \"test@example.com\")",
            "\tend",
            "end",
            "```",
            "---",
            "**Documentation:**",
            "The main method that creates the message and renders the email templates.",
            "There are two ways to call this method, with a block, or without a block.",
            "It accepts a headers hash:",
            "- `:subject` - The subject of the message",
            "- `:to` - Who the message is destined for, can be a string of addresess, or an array of addresses.",
            "- `:from` - Who the message is from",
            "- `:cc` - Who you would like to Carbon-Copy on this email, can be string or array of addresses",
            "- `:bcc` - Who you would like to Blind-Carbon-Copy on this email, can be string or array of addresses",
            "- `:reply_to` - Who to set the `Rely-To` header of the email to.",
            "- `:date` - The date to say the email was sent on.",
            "You can set the default values for any of the above headers (except `:date`) using the `:default` class method"
          ].join("\n")
        )
      end
    end
  end
end
