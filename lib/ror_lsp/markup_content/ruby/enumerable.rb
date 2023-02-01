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
            "**Documentation:**",
            "Returns whether any element meets a given criterion.\n",
            "[link](https://docs.ruby-lang.org/en/master/Enumerable.html#method-i-any-3F)"
          ].join("\n")
        )
      end
    end
  end
end
