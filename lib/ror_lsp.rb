# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

require "language_server-protocol"
require "logger"

module RorLsp
  $logger = Logger.new("/Users/marcusheng/open-source/ruby/ror-lsp/out.log")

  def self.run
    writer = LanguageServer::Protocol::Transport::Stdio::Writer.new
    reader = LanguageServer::Protocol::Transport::Stdio::Reader.new

    reader.read do |request|
      handler = Handlers.new(request, writer)
      handler.call
    end
  end
end
