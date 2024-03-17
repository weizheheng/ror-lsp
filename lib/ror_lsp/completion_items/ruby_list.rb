# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class RubyList
      class << self
        def call
          [
            {label: "each_with_object", kind: 2},
            {label: "any?", kind: 2},
            {
              label: "sort_by",
              kind: 2,
              insert_text_format: 2,
              insert_text: "sort_by { |${1:element}| ${2:value} }"
            }
          ]
        end
      end
    end
  end
end
