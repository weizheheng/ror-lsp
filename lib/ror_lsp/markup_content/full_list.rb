# frozen_string_literal: true

module RorLsp::MarkupContent
  class FullList
    class << self
      def call
        {**RailsList.call, **RubyList.call}
      end
    end
  end
end
