# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::ActiveRecord
      class << self
        def call
          [
            {
              label: "has_secure_token",
              kind: 2,
              insert_text_format: 2,
              insert_text: "has_secure_token :${1:attribute}"
            },
            {label: "has_secure_password", kind: 2},
            {
              label: "authenticate_by",
              kind: 2,
              insert_text_format: 2,
              insert_text:
                "authenticate_by(email: ${1:email}, password: ${2:password})"
            },
            {
              label: "has_many",
              kind: 2,
              insert_text_format: 2,
              insert_text: "has_many :${1:models}"
            },
            {
              label: "belongs_to",
              kind: 2,
              insert_text_format: 2,
              insert_text: "belongs_to :${1:models}"
            },
            {
              label: "before_save",
              kind: 2,
              insert_text_format: 2,
              insert_text: "before_save :${1:method}"
            },
            {label: "exists?", kind: 2}
          ]
        end
      end
    end
  end
end
