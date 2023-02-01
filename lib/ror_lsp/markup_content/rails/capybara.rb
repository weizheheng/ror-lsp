# frozen_string_literal: true

module RorLsp::MarkupContent
  class Rails::Capybara
    class << self
      def visit
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Capybara]",
            "visit(vist_uri) # => Object",
            "```",
            "**Example usage:**",
            "```ruby",
            "visit(sign_up_url)",
            "visit('/projects')",
            "```",
            "**Documentation:**",
            "Navigate to the given URL. The URL can either be a relative URL or an absolute URL"
          ].join("\n")
        )
      end

      def assert_selector
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Capybara]",
            "assert_selector(*args, &optional_filter_block) # => Object",
            "```",
            "**Example usage:**",
            "```ruby",
            "assert_selector('p#foo')",
            "assert_selector('p#foo', count: 4)",
            "assert_selector('p#foo', maximum: 10)",
            "assert_selector('p#foo', minimum: 1)",
            "assert_selector('p#foo', between: 1..10)",
            "assert_selector('li', text: 'Horse' visible: true)",
            "```",
            "**Documentation:**",
            "Asserts that a given selector is on the page or a descendant of the current node\n",
            "*Assertion options:*",
            "- `:text` (String, Regexp) - Only find elements which contain this text or match this regexp",
            "- `:visible` (Boolean, Symbol)",
            "\t- `true` - only finds visible elements",
            "\t- `false` - finds invisible and visible elements",
            "\t- `:all` - same as false",
            "\t- `:hidden` - only finds invisible elements",
            "- `:id` (String, Regexp) - Only find elements with an id that matches the value passed",
            "- `:class` (String, Array<String>, Regexp) - Only find elements with matching class/classes",
            "\t- Absence of a class can be checked by prefixing the class name with `!`",
            "- `:style` (String, Regexp, Hash) - Only find elements with matching style",
            "- `:count` (Integer) - Exact number of matches that are expected to be found",
            "- `:maximum` (Integer) - Maximum number of matches that are expected to be found",
            "- `:minimum` (Integer) - Minimum number of matches that are expected to be found",
            "- `:between` (Range) - Number of matches found must be within the given range"
          ].join("\n")
        )
      end

      def fill_in
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Capybara]",
            "fill_in([locator], with: , **options) # => Capybara::Node::Element",
            "```",
            "**Example usage:**",
            "```ruby",
            'fill_in "Name", with: "Bob"',
            "```",
            "**Documentation:**",
            "Locate a text field or text area and fill it in with the given text",
            "The field can be found via its name, id, placeholder, or label text",
            "If no selector is provided this will operate on self or a descendant\n",
            "*Options Hash (**options):",
            "- `wait` (false, true, Numeric) - Maximum time to wait for matching element to appear",
            "- `currently_with` (String) - The current value property of the field to fill in",
            "- `multiple` (Boolean) - Match fields that can have multiple values?",
            "- `id` (String, Regexp) - Match fields that match the id attribute",
            "- `name` (String) - Match fields that match the name attribute",
            "- `placeholder` (String) - Match fields that match the placeholder attribute",
            "- `class` (String, Array<String>, Regexp) - Match fields that match the class(es) provided"
          ].join("\n")
        )
      end

      def select
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Capybara]",
            "select(value = nil, from: nil, **options) # => Capybara::Node::Element",
            "```",
            "**Example usage:**",
            "```ruby",
            'select "March", from: "Month"',
            "```",
            "**Documentation:**",
            "If `from` option is present, finds a select box, or text input with associated datalist",
            "and selects a particular option from it.",
            "Otherwise, it finds an option inside current scope and selects it.",
            "If the select box is a multiple select, `#select` can be called multiple times.",
            "The select box can be found via its name, id, or label text.",
            "The option can be found by its text.\n",
            "*Paramters:*",
            "- `value` (String) *(defaults to: nil)* - Which option to select",
            "- `from` (String) *(defaults to: nil)* - The id, name or label of the select box",
            "*Options Hash (**options):",
            "- `wait` (false, true, Numeric) - Maximum time to wait for matching element to appear"
          ].join("\n")
        )
      end

      def click_button
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Capybara]",
            "click_button([locator], **options) # => Capybara::Node::Element",
            "```",
            "**Example usage:**",
            "```ruby",
            'click_button "Sign Up"',
            "```",
            "**Documentation:**",
            "Find a button on the page and clicks it.",
            "This can be any <input> element of type submit, reset, image, button or it can be a <button> element",
            "All buttons can be found by their id, name, value, or title",
            "<button> elements can also be found by their text content, and image <input> elements by their alt attribute\n",
            "*Options Hash (**options):",
            "- `wait` (false, true, Numeric) - Maximum time to wait for matching element to appear"
          ].join("\n")
        )
      end
    end
  end
end
