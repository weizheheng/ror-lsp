# frozen_string_literal: true

module RorLsp::MarkupContent
  class RubyList
    class << self
      def call
        {
          **enumerable_list
        }
      end

      private

      def enumerable_list
        klass = RorLsp::MarkupContent::Ruby::Enumerable
        klass.singleton_methods.each_with_object({}) do |method, hash|
          hash[method] = -> { klass.send(method) }
        end
      end
    end
  end
end
