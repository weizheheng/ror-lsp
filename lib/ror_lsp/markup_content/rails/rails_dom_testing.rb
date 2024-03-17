# frozen_string_literal: true

module RorLsp::MarkupContent
  class Rails::RailsDomTesting
    class << self
      def assert_select
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails Dom Testing]",
            "assert_select(*args, &block)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            'assert_select "form"',
            'assert_select "form input", 4',
            'assert_select "title", "Welcome"',
            'assert_select "title", { count: 1, text: "Welcome" }',
            'assert_select "form", false',
            'assert_select "body div.header ul.menu"',
            'assert_select "ol" do |element|',
            "\t assert_select element, 'li', 4",
            "end",
            "assert_select \"ol>li:match('id', ?)\", /item-\d+/",
            'assert_select "form input" do',
            "\t assert_select \":match('name', ?)\", /.+/",
            "end",
            "```",
            "---",
            "**Documentation:**",
            "An assertion that selects elements and makes one or more equality tests.\n",
            "If the first argument is an element, selects all matching elements starting from (and including)",
            "that element and all its childern in depth-first order.\n",
            "If no element is specified `assert_select` selects from the element returned in `document_root_element`",
            "unless `assert_select` is called from within an `assert_select` block.\n",
            "When called with a block `assert_select` passes an array of selected elements to the block",
            "Calling `assert_select` from the block, with no element specified, runs the assertion on the complete set",
            "of elements selected by the enclosing assertion. Alternatively, the array may be iterated through",
            "so that `assert_select` can be called separately for each element\n",
            "*Equality tests options:",
            "- `:text` - Narrow the selection to elements that have this text value (string or regexp).",
            "- `:html` - Narrow the selection to elements that have this HTML content (string or regexp).",
            "- `:count` - Assertion is true if the number of selected elements is equal to this value.",
            "- `:minimum` - Assertion is true if the number of selected elements is at least this value.",
            "- `:maximum` - Assertion is true if the number of selected elements is at most this value."
          ].join("\n")
        )
      end
    end
  end
end
