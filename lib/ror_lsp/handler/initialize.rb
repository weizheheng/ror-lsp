# frozen_string_literal: true

module RorLsp::Handler
  LSP = LanguageServer::Protocol

  class Initialize
    def initialize(request, writer)
      @request = request
      @writer = writer
    end

    def call
      result = LSP::Interface::InitializeResult.new(
        capabilities: LSP::Interface::ServerCapabilities.new(
          text_document_sync: LSP::Interface::TextDocumentSyncOptions.new(
            open_close: true,
            save: false
          ),
          completion_provider: LSP::Interface::CompletionOptions.new(
            resolve_provider: true
          ),
          hover_provider: LSP::Interface::HoverClientCapabilities.new(dynamic_registration: false)
        )
      )

      @writer.write(id: @request[:id], result: result)
    end
  end
end
