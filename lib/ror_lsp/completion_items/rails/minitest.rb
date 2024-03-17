# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::Minitest
      class << self
        def call
          [
            {
              label: "assert_equal",
              kind: 2,
              insert_text_format: 2,
              insert_text: "assert_equal(${1:expected}, ${2:actual})"
            },
            {
              label: "assert_match",
              kind: 2,
              insert_text_format: 2,
              insert_text: "assert_match(${1:matcher}, ${2:object})"
            },
            {
              label: "assert_nil",
              kind: 2,
              insert_text_format: 2,
              insert_text: "assert_nil(${1:object})"
            },
            {
              label: "assert_not_nil",
              kind: 2,
              insert_text_format: 2,
              insert_text: "assert_not_nil(${1:object})"
            },
            {
              label: "assert_template",
              kind: 2,
              insert_text_format: 2,
              insert_text: "assert_template(${1:template})"
            }
          ]
        end
      end
    end
  end
end
