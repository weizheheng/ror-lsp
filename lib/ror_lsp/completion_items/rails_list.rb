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
            *Rails::RailsDomTesting.call,
            *Rails::Capybara.call
          ]
        end
      end
    end
  end
end
