# frozen_string_literal: true

module RorLsp::HoverMarkupContent
  class ActiveModel::SecurePassword::ClassMethods
    class << self
      def has_secure_password
        contents = LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby\nhas_secure_password(attribute = :password, validates: true)\n```",
            "---",
            "```ruby",
            "# Example usage:",
            "# Schema: User(password_disgest:string, recovery_password_digest:string)",
            "class User < ActiveRecord::Base",
            "\thas_secure_password",
            "\thas_secure_password :recovery_password, validations: false",
            "end",
            "```",
            "Adds methods to set and authenticate against a BCrypt password.",
            "This mechanism requires you to have a `XXX_digest` attribute.",
            "Where `XXX` is the attribute name of your desired password.\n",
            "The following validations are added automatically:",
            "* Password must be present on creation",
            "* Password length should be less than or equal to 72 bytes",
            "* Confirmation of password (using a `XXX_confirmation` attribute)"
          ].join("\n")
        )
        LanguageServer::Protocol::Interface::Hover.new(
          contents: contents
        )
      end
    end
  end
end
