# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::RailsDomTesting
      class << self
        def call
          [
            {
              label: "assert_select",
              kind: 2,
              insert_text_format: 2,
              insert_text: 'assert_select "${1:element}", "${2:expected}"'
            }
          ]
        end
      end
    end
  end
end
