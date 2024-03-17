# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class Rails::String
      class << self
        def call
          [{label: "parameterize", kind: 2}]
        end
      end
    end
  end
end
