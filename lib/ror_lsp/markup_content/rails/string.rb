# frozen_string_literal: true

module RorLsp::MarkupContent
  class Rails::String
    class << self
      def parameterize
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "parameterize(separator: \"-\", preserve_case: false, locale: nil)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class Person",
            "\tdef to_param",
            "\t\t\"\#{id}-\#{name.parameterize}\"",
            "\tend",
            "end",
            "",
            "@person = Person.find(1)",
            "# => #<Person id: 1, name: \"Donald E. Knuth\"",
            "```",
            "```eruby",
            "<%= link_to(@person.name, person_path) %>",
            "<%= # => <a href=\"/person/1-donald-e-knuth\">Donald E. Knuth</a> %>",
            "```",
            "---",
            "**Documentation:**",
            "- Replaces special characters in a string so that it may be used as part of a 'pretty' URL.",
            "- If the optional parameter `locale` is specified, the word will be parameterized as a word of that language",
            "- To preserve the case of the characters in a string, use the `preserve_case` argument."
          ].join("\n")
        )
      end
    end
  end
end
