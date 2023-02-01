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
            {label: "has_secure_password", kind: 2}
          ]
        end
      end
    end
  end
end
