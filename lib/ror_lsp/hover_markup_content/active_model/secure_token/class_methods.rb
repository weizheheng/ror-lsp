# frozen_string_literal: true

module RorLsp::HoverMarkupContent
  class ActiveModel::SecureToken::ClassMethods
    class << self
      def has_secure_token
        contents = LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# Schema: User(token:string, auth_token:string)",
            "has_secure_token(attribute = :token, length: MINIMUM_TOKEN_LENGTH)",
            "```",
            "```ruby",
            "# Example usage:",
            "class User < ActiveRecord::Base",
            "\thas_secure_token",
            "\thas_secure_token :auth_token, length: 36",
            "end",
            "```",
            "**NOTE:**",
            "* `SecureRandom::base58` is used to generate a minimum 24-character unique token.",
            "* Note that it's still possible to generate a race condition in the database.",
            "* You're encouraged to add a unique index in the database to deal with it."
          ].join("\n")
        )
        LanguageServer::Protocol::Interface::Hover.new(
          contents: contents
        )
      end
    end
  end
end