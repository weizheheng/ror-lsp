# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::AbstractController
      class << self
        def call
          [
            {
              label: "skip_before_action",
              kind: 2,
              insert_text_format: 2,
              insert_text: "skip_before_action :${1:method}"
            },
            {
              label: "helper_method",
              kind: 2,
              insert_text_format: 2,
              insert_text: "helper_method :${1:method}"
            }
          ]
        end
      end
    end
  end
end
