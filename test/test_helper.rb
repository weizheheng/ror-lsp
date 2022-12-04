# frozen_string_literal: true

require "simplecov"
require "simplecov_json_formatter"
SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ror/lsp"

require "minitest/autorun"
