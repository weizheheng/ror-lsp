# frozen_string_literal: true

require_relative "lib/ror/lsp/version"

Gem::Specification.new do |spec|
  spec.name = "ror-lsp"
  spec.version = Ror::Lsp::VERSION
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
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency("debug", "~> 1.7.0")
  spec.add_development_dependency("standardrb")
end
