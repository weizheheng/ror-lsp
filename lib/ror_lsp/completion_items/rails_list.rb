# frozen_string_literal: true

module RorLsp
  module CompletionItems
    class RailsList
      class << self
        def call
          [
            *Rails::ActiveModel.call,
            *Rails::ActiveRecord.call,
            *Rails::ActiveSupport.call,
            *Rails::ActionDispatch.call,
            *Rails::ActionView.call,
            *Rails::RailsDomTesting.call,
            *Rails::Capybara.call,
            *Rails::Minitest.call,
            *Rails::ActionMailer.call,
            *Rails::AbstractController.call,
            *Rails::ActionController.call,
            *Rails::String.call
          ]
        end
      end
    end
  end
end
