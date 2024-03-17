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
            {label: "follow_redirect!", kind: 2},
            {
              label: "flash",
              kind: 2,
              insert_text_format: 2,
              insert_text: "flash[:${1:type}] = \"${2:message}\""
            },
            {
              label: "cookies",
              kind: 2,
              insert_text_format: 2,
              insert_text: "cookies[:${1:name}] = ${2:value}"
            },
            {
              label: "session",
              kind: 2,
              insert_text_format: 2,
              insert_text: "session[:${1:data}] = ${2:value}"
            },
            {
              label: "reset_session",
              kind: 2,
              insert_text_format: 2,
              insert_text: "reset_session"
            }
          ]
        end
      end
    end
  end
end
