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
            "---",
            "**Example usage:**",
            "```ruby",
            "# Schema: User(password_disgest:string, recovery_password_digest:string)",
            "class User < ActiveRecord::Base",
            "\thas_secure_password",
            "\thas_secure_password :recovery_password, validations: false",
            "end",
            "```",
            "---",
            "**Documentation:**",
            "- Adds methods to set and authenticate against a BCrypt password.",
            "- This mechanism requires you to have a `XXX_digest` attribute.",
            "- Where `XXX` is the attribute name of your desired password.",
            "- The following validations are added automatically:",
            "\t- Password must be present on creation",
            "\t- Password length should be less than or equal to 72 bytes",
            "\t- Confirmation of password (using a `XXX_confirmation` attribute)"
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
            "---",
            "**Example usage:**",
            "```ruby",
            "# Schema: User(token:string, auth_token:string)",
            "class User < ActiveRecord::Base",
            "\thas_secure_token",
            "\thas_secure_token :auth_token, length: 36",
            "end",
            "```",
            "---",
            "**Documentation:**",
            "* `SecureRandom::base58` is used to generate a minimum 24-character unique token.",
            "* Note that it's still possible to generate a race condition in the database.",
            "* You're encouraged to add a unique index in the database to deal with it."
          ].join("\n")
        )
      end

      def normalizes
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "normalizes(*names, with:, apply_to_nil: false)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class User < ActiveRecord::Base",
            "\tnormalizes :email, with: -> email { email.strip.downcase }",
            "\tnormalizes :phone, with: -> phone { phone.delete(\"^0-9\").delete_prefix(\"1\") }",
            "end",
            "```",
            "---",
            "**Documentation:**",
            "* Declares a normalization for one or more attributes.",
            "* The normalization is applied when the attribute is assigned or updated, and the normalized value will be persisted to the database",
            "* The normalization is also applied to the corresponding keyword argument of finder methods.",
            "* This allows a record to be created and later queried using unnormalized values.",
            "* However, to prevent confusion, the normalization will not be applied when the attribute is fetched from the database.",
            "* This means that if a record was persisted before the normalization was declared, the record’s attribute will not be normalized until either it is assigned a new value",
            "* applying the normalization more than once should have the same result as applying it only once.",
            "\n*Options:*",
            "- `:with` - The normalization to apply",
            "- `:apply_to_nil` - Whether to apply the normalization to `nil` values. Defaults to `false`."
          ].join("\n")
        )
      end

      def authenticate_by
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "authenticate_by(attributes)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class User < ActiveRecord::Base",
            "\thas_secure_password",
            "end",
            "",
            "User.create(name: \"John Doe\", email: \"jdoe@example.com\", password: \"123456\")",
            "User.authenticate_by(email: \"jdoe@example.com\", password: \"123456\").name # => \"John Doe\"",
            "User.authenticate_by(email: \"jdoe@example.com\", password: \"wrong\")       # => nil",
            "User.authenticate_by(email: \"wrong@example.com\", password: \"123456\")     # => nil",
            "",
            "User.authenticate_by(email: \"jdoe@example.com\", password: nil)  # => nil (no queries executed)",
            "User.authenticate_by(email: \"jdoe@example.com\", password: \"\") # => nil (no queries executed)",
            "",
            "User.authenticate_by(email: \"jdoe@example.com\") # => ArgumentError",
            "User.authenticate_by(password: \"123456\") # => ArgumentError",
            "```",
            "---",
            "**Documentation:**",
            "* Given a set of attributes, finds a record using the non-password attributes, and then authenticates that record using the password attributes.",
            "* Returns the record if authentication succeeds; otherwise, returns `nil`.",
            "* Regardless of whether a record is found, `authenticate_by` will cryptographically digest the given password attributes.",
            "* This behavior helps mitigate timing-based enumeration attacks.",
            "* Raises an ArgumentError if the set of attributes doesn’t contain at least one password and one non-password attribute."
          ].join("\n")
        )
      end

      def has_many
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "has_many(name, scope = nil, **options, &extension)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class Firm < ActiveRecord::Base",
            "\thas_many :clients",
            "\thas_many :clients, dependent: :destroy",
            "end",
            "",
            "firm = Firm.find(2)",
            "client = Client.find(6)",
            "",
            "firm.clients                         # similar to Client.where(firm_id: 2)",
            "firm.clients << client",
            "firm.clients.delete(client)",
            "firm.clients.destroy(client)",
            "firm.client_ids",
            "firm.client_ids = [6]",
            "firm.clients.clear",
            "firm.clients.empty?                  # similar to firm.clients.size == 0",
            "firm.clients.size                    # similar to Client.count \"firm_id = 2\"",
            "firm.clients.find                    # similar to Client.where(firm_id: 2).find",
            "firm.clients.exists?(name: 'ACME')   # similar to Client.exists?(name: 'ACME', firm_id: 2)",
            "firm.clients.build                   # similar to Client.new(firm_id: 2)",
            "firm.clients.create                  # similar to Client.create(firm_id: 2)",
            "firm.clients.create!                 # similar to Client.create!(firm_id: 2)",
            "firm.clients.reload",
            "```",
            "---",
            "**Documentation:**",
            "- Specifies a one-to-many assocation",
            "---",
            "**Scopes:**",
            "- You can pass a second argument `scope` as a callable (i.e. proc or lambda) to retrieve specific set of records",
            "```ruby",
            "has_many :comments, -> { where(author_id: 1) }",
            "has_many :employess, -> { joins(:address) }",
            "has_many :posts, ->(blog) { where(\"max_post_length > ?\", blog.max_post_length) }",
            "```",
            "---",
            "**Options:**",
            "- `:dependent`",
            "\t- `nil`: do nothing (default)",
            "\t- `destroy`: causes all the associated objects to also be destroyed",
            "\t- `destroy_async`: destroys all the associated objects in a background job",
            "\t\t WARNING: Do not use this option if the association is backed by foreign key constraints in your database.",
            "\t\t The foreign key constraint actions will occur inside the same transaction that deletes its owner.",
            "\t- `delete_all`: causes all the associated objcets to be deleted directly from the database (no callbacks)",
            "\t- `nullify`: causes the foreign key to be set to `NULL`.",
            "\t\t Polymorphic type will also be nullified on polymorphic associations. Callbacks are not executed."
          ].join("\n")
        )
      end

      def belongs_to
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "belongs_to(name, scope = nil, **options)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class Post < ActiveRecord::Base",
            "\tbelongs_to :author",
            "end",
            "",
            "post = Post.find(7)",
            "author = Author.find(19)",
            "",
            "post.author           # similar to Author.find(post.author_id)",
            "post.author = author  # similar to post.author_id = author.id",
            "post.build_atuhor     # similar to post.author = Author.new",
            "post.create_atuhor    # similar to post.author = Author.new; post.author.save; post.author",
            "post.create_atuhor!   # similar to post.author = Author.new; post.author.save!; post.author",
            "post.reload_author",
            "post.reset_author",
            "post.author_changed?",
            "post.author_previously_changed?",
            "```",
            "---",
            "**Documentation:**",
            "- Specifies a one-to-one association with another class",
            "---",
            "**Scopes:**",
            "- You can pass a second argument `scope` as a callable (i.e. proc or lambda) to retrieve specific set of records",
            "```ruby",
            "belongs_to :firm, -> { where(id: 1) }",
            "belongs_to :user, -> { joins(:friends) }",
            "belongs_to :level, ->(game) { where(\"game_level > ?\", game.current_level) }",
            "```",
            "---",
            "**Options:**",
            "- `:dependent`",
            "\t- `destroy` - The associated object is destroyed when this object is.",
            "\t- `delete` - The associated object is deleted without calling its destroy method",
            "\t- `destroy_async` - The associated object is scheduled to be destroyed in a background job.",
            "\tThis option should not be specified when `belongs_to` is used in conjunction with a `has_many` relationship"
          ].join("\n")
        )
      end

      def before_save
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "before_save(*args, &block)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class Post < ActiveRecord::Base",
            "\tbefore_save :do_something",
            "end",
            "```",
            "---",
            "**Documentation:**",
            "- Registers a callback to be called around the save of a record."
          ].join("\n")
        )
      end

      def exists?
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "exists?(condition = :none)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "Person.exists?(5)",
            "Person.exists?(\"5\")",
            "Person.exists?(['name LIKE ?', \"%\#{query}%\"])",
            "Person.exists?(id: [1, 4, 8])",
            "Person.exists?(name: 'David')",
            "Person.exists?(false)",
            "Person.exists?",
            "Person.where(name: 'Spartacus', rating: 4).exists?",
            "```",
            "---",
            "**Documentation:**",
            "- Returns true if a record exists in the table that matches the `id` or conditions given, or false otherwise.",
            "- The argument can take six forms:",
            "\t- `Integer` - Finds the record with this primary key.",
            "\t- `String` - Finds the record with a primary key corresponding to this string",
            "\t- `Array` - Finds the record that matches these `where`-style conditions",
            "\t- `Hash` - Finds the record that matchs these `where`-style conditions",
            "\t- `false` - Returns always `false`",
            "\t- No args - Returns `false` if the relation is empty, `true` otherwise."
          ].join("\n")
        )
      end
    end
  end
end
