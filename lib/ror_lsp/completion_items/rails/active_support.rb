# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::ActiveSupport
      class << self
        def call
          [
            {
              label: "assert_difference",
              kind: 2,
              insert_text_format: 2,
              insert_text: [
                "assert_difference \"${1:expression}\", ${2:count}",
                "\t${3:action}",
                "end"
              ].join("\n")
            }
          ]
        end
      end
    end
  end
end
