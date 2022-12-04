# frozen_string_literal: true

module RorLsp::HoverMarkupContent
  class Base
    def initialize(target_message)
      @target_message = target_message
    end

    def call
      return unless respond_to?(@target_message.to_sym)

      send(@target_message.to_sym)
    end

    def has_secure_token
      ActiveModel::SecureToken::ClassMethods.has_secure_token
    end

    def has_secure_password
      ActiveModel::SecurePassword::ClassMethods.has_secure_password
    end

    def validates_presence_of
      ActiveModel::Validations::HelperMethods.validates_presence_of
    end
  end
end
