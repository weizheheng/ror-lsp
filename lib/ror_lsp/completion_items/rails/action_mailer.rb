# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::ActionMailer
      class << self
        def call
          [
            {
              label: "assert_enqueued_email_with",
              kind: 2,
              insert_text_format: 2,
              insert_text: "assert_enqueued_email_with(${1:mailer}, ${2:method})"
            },
            {
              label: "mail",
              kind: 2,
              insert_text_format: 2,
              insert_text: "mail(to: ${1:email})"
            }
          ]
        end
      end
    end
  end
end
