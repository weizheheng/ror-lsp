# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::ActionDispatch
      class << self
        def call
          [
            {
              label: "assert_response",
              kind: 2,
              insert_text_format: 2,
              insert_text: "assert_response :${1:status}"
            },
            {
              label: "assert_redirected_to",
              kind: 2,
              insert_text_format: 2,
              insert_text: "assert_redirected_to ${1:url}"
            },
            {label: "follow_redirect!", kind: 2}
          ]
        end
      end
    end
  end
end
