module RorLsp::Handler
  class CompletionItemResolve
    def initialize(request, writer)
      @request = request
      @writer = writer
    end

    def call
      # Seems like I don't have to do anything here
      @writer.write(id: @request[:id], result: [])
    end
  end
end
