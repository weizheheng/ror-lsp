# frozen_string_literal: true

module RorLsp::MarkupContent::Rails
  class ActionView
    class << self
      def button_to
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "button_to(name = nil, options = nil, html_options = nil, &block)",
            "```",
            "---",
            "**Example usage:**",
            "```eruby",
            "<%= button_to \"Logout\", logout_path, method: :delete %>",
            "```",
            "---",
            "**Documentation**:",
            "- Generates a form containing a single button that submits to the URL created by the set of options",
            "\n*Options:*",
            "- `:method` - Symbol of HTTP verb. `:post`, `:get`, `:delete`, `:patch`, `:put`",
            "- `:class` - CSS classes to the button element",
            "- `:disabled` - If set to true, it will generate a disabled button",
            "- `:data` - This option can be used to add custom data attributes",
            "- `:form` - This hash will be form attributes",
            "- `:form_class` - This controls the class of the form within which the submit button will be placed",
            "- `:params` - Hash of parameters to be rendered as hidden fields within the form"
          ].join("\n")
        )
      end

      def link_to
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "link_to(name = nil, options = nil, html_options = nil, &block)",
            "```",
            "---",
            "**Example usage:**",
            "```eruby",
            "<%= link_to \"User\", user_path(@user) %>",
            "<%= link_to(@profile) do %>",
            "\t<strong><%= @profile.name %></strong>",
            "\t<span>Check it out!</span>",
            "<% end %>",
            "```",
            "---",
            "**Documentation**:",
            "- Creates an anchor element of the given name using a URL created by the set of `options`",
            "\n*Options:*",
            "- `:class` - CSS classes to the button element",
            "- `:data` - This option can be used to add custom data attributes"
          ].join("\n")
        )
      end

      def layout
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "layout(layout, conditions = {})",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "def UsersController < ApplicationController",
            "\tlayout \"dashboard\", only: [:show]",
            "end",
            "```",
            "---",
            "**Documentation**:",
            "Specify the layout to use for this class.",
            "\nIf the specified layout is a:",
            "- `String`: the `String` is the template name",
            "- `Symbol`: call the method specified by the symbol",
            "- `Proc`: call the passed Proc",
            "- `false`: There is no layout",
            "- `true`: raise an ArgumentError",
            "- `nil`: Force default layout behavior with inheritance",
            "\n*Parameters:*",
            "- `layout` - The layout to use",
            "\n*Options:*",
            "- `:only` - A list of actions to apply this layout to",
            "- `:except` - Apply this layout to all actions but this one"
          ].join("\n")
        )
      end
    end
  end
end
