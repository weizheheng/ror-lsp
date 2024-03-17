# frozen_string_literal: true

module RorLsp::MarkupContent
  class Rails::AbstractController
    class << self
      def skip_before_action
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "skip_before_action(names)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "def SomeController < ApplicationController",
            "\tskip_before_action :authenticate, except: :index",
            "end",
            "```",
            "---",
            "**Documentation:**",
            "Skip a callback before actions.",
            "",
            "Available options:",
            "- `:only` - The callback should be run only for this action",
            "- `:except` - The callback should be run for all actions except this action"
          ].join("\n")
        )
      end

      def helper_method
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "helper_method(*methods)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "def ApplicationController < ActionController::Base",
            "\thelper_method :current_user, :logged_in?",
            "",
            "\tprivate",
            "",
            "\tdef current_user",
            "\t\t@current_user ||= User.find_by(id: session[:user])",
            "\tend",
            "",
            "\tdef logged_in?",
            "\t\tcurrent_user != nil",
            "\tend",
            "end",
            "```",
            "",
            "```eruby",
            "<% if logged_in? %>Welcome, <%= current_user.name %><% end %>",
            "```",
            "---",
            "**Documentation:**",
            "Declare a controller as a helper.",
            "",
            "Parameters:",
            "- `method[, method]` - A name or names of a method on the controller to be made available on the view"
          ].join("\n")
        )
      end
    end
  end
end
