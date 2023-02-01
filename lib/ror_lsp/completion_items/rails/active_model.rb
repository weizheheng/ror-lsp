# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::ActiveModel
      class << self
        def call
          [
            {
              label: "validates_presence_of",
              kind: 2,
              insert_text_format: 2,
              insert_text: "validates_presence_of :${1:attribute}"
            },
            {
              label: "validates_length_of",
              kind: 2,
              insert_text_format: 2,
              insert_text: "validates_length_of :${1:attribute}, ${2:constraint}"
            },
            {
              label: "validates_format_of",
              kind: 2,
              insert_text_format: 2,
              insert_text: "validates_format_of :${1:attribute}, with: ${2:regexp}"
            },
            {
              label: "validates_uniqueness_of",
              kind: 2,
              insert_text_format: 2,
              insert_text: "validates_uniqueness_of :${1:attribute}"
            }
          ]
        end
      end
    end
  end
end
