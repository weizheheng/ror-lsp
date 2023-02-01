# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class FullList
      def call
        full_options.map do |options|
          CompletionItem.new(options, documentation_list).call
        end
      end

      private

      def full_options
        @full_options ||= [*RailsList.call, *RubyList.call]
      end

      def documentation_list
        @documentation_list ||= RorLsp::MarkupContent::FullList.call
      end
    end
  end
end
