# frozen_string_literal: true

module RorLsp::MarkupContent
  class Ruby::Enumerable
    class << self
      def each_with_object
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Ruby 3.2.0]",
            "each_with_object(object) { |(*args), memo_object| ... } -> object",
            "each_with_object(object) -> enumerator }",
            "```",
            "**Example usage:**",
            "---",
            "```ruby",
            "(1..4).each_with_object([]) { |i, a| a.push(i**2) }",
            "# => [1, 4, 9, 16]\n",
            "h = {foo: 0, bar: 1, baz: 2}",
            "h.each_with_object({}) do |element, h|",
            "\tk,v = *element",
            "\th[v] = k",
            "end",
            "# => {0=>:foo, 1=>:bar, 2=>:baz}",
            "```",
            "---",
            "**Documentation:**",
            "* Calls the block once for each element, passing both the element and the given object",
            "* With no block given, returns an Enumerator\n",
            "[link](https://docs.ruby-lang.org/en/master/Enumerable.html#method-i-each_with_object)"
          ].join("\n")
        )
      end

      def any?
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Ruby 3.2.0]",
            "any? -> true or false",
            "any?(pattern) -> true or false",
            "any? { |element| ... } -> true or false",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "# With no argument and no block, returns whether any element is truthy",
            "[1, false, nil].any? # => true",
            "[].any?              # => false\n",
            "# With argument pattern and no block, returns whether for any element, pattern === element",
            "[1, false, nil].any?(Integer)  # => true",
            "%w[bar baz bat].any?(/foo/)    # => false\n",
            "# With a block given, returns whether the block returns a truthy value for any element:",
            "(1..4).any? {|element| element < 2 }   # => true",
            "(1..4).any? {|element| element < 1 }   # => false",
            "```",
            "---",
            "**Documentation:**",
            "Returns whether any element meets a given criterion.\n",
            "[link](https://docs.ruby-lang.org/en/master/Enumerable.html#method-i-any-3F)"
          ].join("\n")
        )
      end

      def sort_by
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Ruby 3.2.2]",
            "sort_by { |element| ...  } -> array",
            "sort_by -> enumerator",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "a = %w[xx xxx x xxx]",
            "a.sort_by { |s| s.size }         # => [\"x\", \"xx\", \"xxx\", \"xxxx\"]",
            "h = {foo: 2, bar: 1, baz: 0}",
            "h.sort_by { |key, value| value } # => [[:baz, 0], [:bar, 1], [:foo, 2]]",
            "h.sort_by { |key, value| key }   # => [[:bar, 1], [:baz, 0], [:foo, 2]]",
            "```",
            "---",
            "**Documentation:**",
            "- With a block given, returns an array of elements of self, sorted according to the value returned.",
            "- The ordering of equal elements is indeterminate and may be unstable.",
            "- With no block given, returns an Enumerator"
          ].join("\n")
        )
      end
    end
  end
end
