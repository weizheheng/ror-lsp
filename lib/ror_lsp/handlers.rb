# frozen_string_literal: true

module RorLsp
  class Handlers
    def initialize(request, writer)
      @request = request
      @writer = writer
    end

    def call
      method = @request[:method]

      case method
      when "initialize"
        Handler::Initialize.new(@request, @writer).call
      when "textDocument/hover"
        Handler::Hover.new(@request, @writer).call
      else
        $logger.debug("Not supported method: #{method}")
      end
    end
  end
end
