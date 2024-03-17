# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::ActionView
      class << self
        def call
          [
            {
              label: "button_to",
              kind: 2,
              insert_text_format: 2,
              insert_text: "button_to \"${1:name}\", ${2:path}, class: \"${3}\""
            },
            {
              label: "link_to",
              kind: 2,
              insert_text_format: 2,
              insert_text: "link_to \"${1:name}\", ${2:path}, class: \"${3}\""
            },
            {
              label: "layout",
              kind: 2,
              insert_text_format: 2,
              insert_text: "layout \"${1:layout}\""
            }
          ]
        end
      end
    end
  end
end
