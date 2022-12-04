# frozen_string_literal: true

require_relative "lib/ror_lsp/version"

Gem::Specification.new do |spec|
  spec.name = "ror-lsp"
  spec.version = RorLsp::VERSION
  spec.authors = ["Wei Zhe Heng"]
  spec.email = ["tech@weizheheng.com"]

  spec.summary = "Ruby on Rails LSP"
  spec.description = "This LSP aims to make Ruby on Rails development experience fun"
  spec.homepage = "https://github.com/weizheheng/ror-lsp"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/weizheheng/ror-lsp"
  spec.metadata["changelog_uri"] = "https://github.com/weizheheng/ror-lsp"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = ["ror-lsp"]

  spec.require_paths = ["lib"]

  spec.add_dependency("language_server-protocol", "~> 3.17.0")
  spec.add_dependency("syntax_tree", "~> 5.0.1")
  spec.add_dependency("zeitwerk", "~> 2.6.6")

  spec.add_development_dependency("debug", "~> 1.7.0")
  spec.add_development_dependency("standard", "~> 1.19.0")
end
