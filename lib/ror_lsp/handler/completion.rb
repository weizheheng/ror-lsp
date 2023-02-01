# frozen_string_literal: true

module RorLsp::Handler
  LSP = LanguageServer::Protocol

  class Completion
    def initialize(request, writer)
      @request = request
      @writer = writer
    end

    def call
      items = RorLsp::CompletionItems::FullList.new.call

      @writer.write(id: @request[:id], result: items)
    end
  end
end
