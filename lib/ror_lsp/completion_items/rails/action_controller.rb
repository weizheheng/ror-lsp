# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::ActionController
      class << self
        def call
          [
            {
              label: "add_flash_types",
              kind: 2,
              insert_text_format: 2,
              insert_text: "add_flash_types :${1:type}"
            },
            {
              label: "redirect_to",
              kind: 2,
              insert_text_format: 2,
              insert_text: "redirect_to(${1:path})"
            },
            {
              label: "render",
              kind: 2,
              insert_text_format: 2,
              insert_text: "render(:${1:action}, status: :${2:code_symbol})"
            }
          ]
        end
      end
    end
  end
end
