# frozen_string_literal: true

module RorLsp::MarkupContent
  class Rails::ActiveRecord
    class << self
      def has_secure_password
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "has_secure_password(attribute = :password, validates: true)",
            "```",
            "**Example usage:**",
            "```ruby",
            "# Schema: User(password_disgest:string, recovery_password_digest:string)",
            "class User < ActiveRecord::Base",
            "\thas_secure_password",
            "\thas_secure_password :recovery_password, validations: false",
            "end",
            "```",
            "**Documentation:**",
            "Adds methods to set and authenticate against a BCrypt password.",
            "This mechanism requires you to have a `XXX_digest` attribute.",
            "Where `XXX` is the attribute name of your desired password.\n",
            "The following validations are added automatically:",
            "- Password must be present on creation",
            "- Password length should be less than or equal to 72 bytes",
            "- Confirmation of password (using a `XXX_confirmation` attribute)"
          ].join("\n")
        )
      end

      def has_secure_token
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "has_secure_token(attribute = :token, length: MINIMUM_TOKEN_LENGTH)",
            "```",
            "**Example usage:**",
            "```ruby",
            "# Schema: User(token:string, auth_token:string)",
            "class User < ActiveRecord::Base",
            "\thas_secure_token",
            "\thas_secure_token :auth_token, length: 36",
            "end",
            "```",
            "**Documentation:**",
            "* `SecureRandom::base58` is used to generate a minimum 24-character unique token.",
            "* Note that it's still possible to generate a race condition in the database.",
            "* You're encouraged to add a unique index in the database to deal with it."
          ].join("\n")
        )
      end
    end
  end
end
