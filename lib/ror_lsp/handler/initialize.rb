# frozen_string_literal: true

module RorLsp::Handler
  class Initialize
    def initialize(request, writer)
      @request = request
      @writer = writer
    end

    def call
      result = LanguageServer::Protocol::Interface::InitializeResult.new(
        capabilities: LanguageServer::Protocol::Interface::ServerCapabilities.new(
          text_document_sync: LanguageServer::Protocol::Interface::TextDocumentSyncOptions.new(
            open_close: true,
            save: false
          ),
          hover_provider: LanguageServer::Protocol::Interface::HoverClientCapabilities.new(dynamic_registration: false)
        )
      )

      @writer.write(id: @request[:id], result: result)
    end
  end
end
