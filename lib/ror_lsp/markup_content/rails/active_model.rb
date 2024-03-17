# frozen_string_literal: true

module RorLsp::MarkupContent::Rails
  class ActiveModel
    class << self
      def validates_presence_of
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "validates_presence_of(*attr_names)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class User < ActiveRecord::Base",
            "\tvalidates_presence_of :first_name",
            "end",
            "```",
            "---",
            "**Documentation**:",
            "- If you want to validate the presence of a boolean field, you will want to use:",
            "\t- `validates_inclusion_of :field_name, in: [true, false]`",
            "\n*Configuration options:*",
            "- `:message` - A custom error message (default is: \"can't be blank\")",
            "\n*Default options:*",
            "- `:on` - Specifies the contexts where this validation is active. Runs in all validation contexts by default nil",
            "- `:allow_nil` - If set to `true`, skips this validation if the attribute is `nil` (default is `false`)",
            "- `:allow_blank` - If set to `true`, skips this validation if the attribute is blank (default is `false`)",
            "- `:if` - Specifies a method, proc, or string to call to determine if the validation should occur",
            "- `:unless` - Specifies a method, proc, or string to call to determine if the validation should not occur",
            "- `:strict` - If the :strict option is set to true will raise ActiveModel::StrictValidationFailed instead of adding the error."
          ].join("\n")
        )
      end

      def validates_length_of
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "validates_length_of(*attr_names)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class User < ActiveRecord::Base",
            "\tvalidates_length_of :first_name, maximum: 30",
            "\tvalidates_length_of :fax, in: 7..32, allow_nil: true",
            "\tvalidates_length_of :phone, in: 7..32, allow_blank: true",
            "\tvalidates_length_of :smurf_leader, is: 4",
            "\tvalidates_length_of :user_name, within: 6..20",
            "end",
            "```",
            "---",
            "**Documentation**:",
            "- Validates that the specified attributes match the length restrictions supplied.",
            "- Only one constraint option can be used at a time apart from :minimum and :maximum.",
            "\n*Constraint options:*",
            "- `:minimum` - The minimum size of the attribute",
            "- `:maximum` - The maximum size of the attribute",
            "- `:is` - The exact size of the attribute",
            "- `:within` - A range specifying the minimum and maximum size of the attribute",
            "- `:in` - A synonym (or alias) for `:within`",
            "\n*Other options:*",
            "- `:allow_nil` - Attribute may be `nil`; skip validation",
            "- `:allow_blank` - Attribute may be blank; skip validation",
            "- `:too_long` - The error message if the attribute goes over the maximum",
            "- `:too_short` - The error message if the attribute goes under the minimum",
            "- `:wrong_length` - The error message if using the `:is` and the attribute is the wrong size",
            "- `:message` - The error message to use for a `:minimum`, `:maximum`, or `:is` violation",
            "\n*Default options:*",
            "- `:on` - Specifies the contexts where this validation is active. Runs in all validation contexts by default nil",
            "- `:if` - Specifies a method, proc, or string to call to determine if the validation should occur",
            "- `:unless` - Specifies a method, proc, or string to call to determine if the validation should not occur",
            "- `:strict` - If the :strict option is set to true will raise ActiveModel::StrictValidationFailed instead of adding the error."
          ].join("\n")
        )
      end

      def validates_format_of
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "validates_format_of(*attr_names)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class User < ActiveRecord::Base",
            "\tvalidates_format_of :email, with: /\\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\\z/i on: :create",
            "\tvalidates_format_of :email, without: /NOSPAM/",
            "\tvalidates_format_of :screen_name, with: ->(user) { user.admin? ? /\\A[a-z0-9][a-z0-9_-]*\\z/i : /\\A[a-z]*\\z/i }",
            "end",
            "```",
            "---",
            "**Documentation**:",
            "- Validates whether the value of the specified attribute is of the correct form, going by the regular expression provided.",
            "- You must pass either `:with` or `:without` as an option. In addition both must be a regular expression or a proc or lambda.",
            "- Note: use `\\A` and `\\z` to match the start and end of the string, `^` and `$` match the start/end of a line.",
            "\n*Configuration options:*",
            "- `:message` - A custom error message (default is: 'is invalid')",
            "- `:with` - Regular expression that if the attribute matches will result in a successful validation.",
            "- `:without` - Regular expression that if the attribute does not match will result in a successful validation.",
            "- `multiline` - Set to true if your Regexp uses `^` and `$`",
            "\n*Default options:*",
            "- `:on` - Specifies the contexts where this validation is active. Runs in all validation contexts by default nil",
            "- `:allow_nil` - If set to `true`, skips this validation if the attribute is `nil` (default is `false`)",
            "- `:allow_blank` - If set to `true`, skips this validation if the attribute is blank (default is `false`)",
            "- `:if` - Specifies a method, proc, or string to call to determine if the validation should occur",
            "- `:unless` - Specifies a method, proc, or string to call to determine if the validation should not occur",
            "- `:strict` - If the :strict option is set to true will raise ActiveModel::StrictValidationFailed instead of adding the error."
          ].join("\n")
        )
      end

      def validates_uniqueness_of
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "validates_uniqueness_of(*attr_names)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "class User < ActiveRecord::Base",
            "\tvalidates_uniqueness_of :user_name",
            "\tvalidates_uniqueness_of :user_name, scope: :account_id",
            "\tvalidates_uniqueness_of :teacher_id, scope: [:semester_id, :class_id]",
            "\tvalidates_uniqueness_of :title, conditions: -> { where.not(status: 'archived') }",
            "\tvalidates_uniqueness_of :title, conditions: ->(article) {",
            "\t\tpublished_at = article.published_at",
            "\t\twhere(published_at: published_at.beginning_of_year..published_at.end_of_year)",
            "\t}",
            "end",
            "```",
            "---",
            "**Documentation**:",
            "- Validates whether the value of the specified attributes are unique across the system.",
            "- When the record is created, a check is performed to make sure that no record with same attribute exists in the database.",
            "- When the record is updated, the same check is made but disregarding the record itself.",
            "\n*Configuration options:*",
            "- `:message` - Specifies a custom error message (default is: 'has already been taken')",
            "- `:scope` - One or more columns by which to limit the scope of the uniqueness constraint.",
            "- `:conditions` - Specify the conditions to be included as a `WHERE` SQL fragment to limit the uniqueness constraint lookup.",
            "- `:case_sensitive` - Looks for an exact match. Ignored by non-text columns.",
            "- `:allow_nil` - If set to `true`, skips this validation if the attribute is `nil` (default is `false`)",
            "- `:allow_blank` - If set to `true`, skips this validation if the attribute is blank (default is `false`)",
            "- `:if` - Specifies a method, proc, or string to call to determine if the validation should occur",
            "- `:unless` - Specifies a method, proc, or string to call to determine if the validation should not occur"
          ].join("\n")
        )
      end
    end
  end
end
