# frozen_string_literal: true

module RorLsp::MarkupContent
  class RailsList
    class << self
      def call
        {
          **content_list(RorLsp::MarkupContent::Rails::ActiveRecord),
          **content_list(RorLsp::MarkupContent::Rails::ActiveModel),
          **content_list(RorLsp::MarkupContent::Rails::ActiveSupport),
          **content_list(RorLsp::MarkupContent::Rails::ActionDispatch),
          **content_list(RorLsp::MarkupContent::Rails::ActionView),
          **content_list(RorLsp::MarkupContent::Rails::RailsDomTesting),
          **content_list(RorLsp::MarkupContent::Rails::Capybara),
          **content_list(RorLsp::MarkupContent::Rails::Minitest),
          **content_list(RorLsp::MarkupContent::Rails::ActionMailer),
          **content_list(RorLsp::MarkupContent::Rails::AbstractController),
          **content_list(RorLsp::MarkupContent::Rails::ActionController),
          **content_list(RorLsp::MarkupContent::Rails::String)
        }
      end

      private

      def content_list(klass)
        klass
          .singleton_methods
          .each_with_object({}) do |method, hash|
            hash[method] = -> { klass.send(method) }
          end
      end
    end
  end
end
