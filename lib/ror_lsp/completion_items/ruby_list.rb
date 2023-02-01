# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class RubyList
      class << self
        def call
          [{label: "each_with_object", kind: 2}, {label: "any?", kind: 2}]
        end
      end
    end
  end
end
