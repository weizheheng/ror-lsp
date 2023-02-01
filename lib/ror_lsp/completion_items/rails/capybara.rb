# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::Capybara
      class << self
        def call
          [
            {
              label: "visit",
              kind: 2,
              insert_text_format: 2,
              insert_text: "visit ${1:path}"
            },
            {
              label: "assert_selector",
              kind: 2,
              insert_text_format: 2,
              insert_text:
                "assert_selector \"${1:element}\", text: \"${2:text}\""
            },
            {
              label: "fill_in",
              kind: 2,
              insert_text_format: 2,
              insert_text: "fill_in \"${1:element}\", with: \"${2:text}\""
            },
            {
              label: "click_button",
              kind: 2,
              insert_text_format: 2,
              insert_text: "click_button \"${1:button_content}\""
            },
            {
              label: "select",
              kind: 2,
              insert_text_format: 2,
              insert_text: "select \"${1:option}\", from: \"${2:select_box}\""
            }
          ]
        end
      end
    end
  end
end
