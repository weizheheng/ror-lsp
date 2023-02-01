# frozen_string_literal: true

module RorLsp
  class HoverMarkupContent
    def initialize(target_message)
      @target_message = target_message
    end

    def call
      target_proc = full_list[@target_message.to_sym]

      return if target_proc.nil?

      contents = target_proc.call

      LanguageServer::Protocol::Interface::Hover.new(
        contents: contents
      )
    end

    private

    def full_list
      @full_list ||= RorLsp::MarkupContent::FullList.call
    end
  end
end
