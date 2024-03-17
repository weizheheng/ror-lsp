# frozen_string_literal: true

module RorLsp::MarkupContent
  class Rails::ActionController
    class << self
      def add_flash_types
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "add_flash_types(*types)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "def ApplicationController < ActionController::Base",
            "\tadd_flash_types :warning",
            "end",
            "",
            "# in your controller",
            "redirect_to user_path(@user), warning: \"Incomplete profile\"",
            "",
            "# in your view",
            "<%= warning %>",
            "```",
            "---",
            "**Documentation:**",
            "* Creates new flash types.",
            "* You can pass as many types as you want to create flash types other than the default alert and notice"
          ].join("\n")
        )
      end

      def redirect_to
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "redirect_to(options = {}, response_options = {})",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "redirect_to action: \"show\", id: 5",
            "redirect_to @post",
            "",
            "# The redirect happens as a `302 Found` header unless otherwise specified using `:status`",
            "redirect_to post_url(@post), status: 301",
            "redirect_to post_url(@post), status: :moved_permanently",
            "",
            "# It is also possible to assign a flash message as part of the redirection",
            "redirect_to post_url(@post), alert: \"Watch it, mister!\"",
            "",
            "# Statements after `redirect_to` in our controller get executed, use return to terminate the execution",
            "redirect_to post_url(@post) && return",
            "",
            "# Open Redirect Protection",
            "# To allow any external redirects pass `allow_other_host: true`",
            "redirect_to \"https://rubyonrails.org\", allow_other_host: true",
            "```",
            "---",
            "**Documentation:**",
            "- Redirects the browser to the target specified in `options`"
          ].join("\n")
        )
      end

      def render
        LanguageServer::Protocol::Interface::MarkupContent.new(
          kind: "markdown",
          value: [
            "```ruby",
            "# [Rails 7.1.0]",
            "render(*args)",
            "```",
            "---",
            "**Example usage:**",
            "```ruby",
            "render \"posts/show\"",
            "# => renders app/views/posts/show.html.erb",
            "# In a PostsController action...",
            "render :show",
            "# => renders app/views/posts/show.html.erb",
            "",
            "# :partial and :locals",
            "render partial: \"posts/form\", locals: { post: Post.new }",
            "# => renders app/views/posts/_form.html.erb",
            "```",
            "---",
            "**Documentation:**",
            "- Renders a template and assigns the result to `self.response_body`",
            "- If no rendering mode options is specified, the template will be derived from the first argument.",
            "---",
            "**Rendering Mode:**",
            "- `:partial`",
            "- `:file`",
            "- `:inline`",
            "- `:body`",
            "- `:plain`",
            "- `:html`",
            "- `:json`",
            "---",
            "**Options**:",
            "- `:assigns` - Hash of instance variable assignments for the template",
            "- `:locals` - Hash of local variable assignments for the template",
            "- `:layout` - The layout template to render. Can also be `false` or `true` to disable or (re)enable the default layout template",
            "- `:status` - The HTTP status code to send with the response."
          ].join("\n")
        )
      end
    end
  end
end
