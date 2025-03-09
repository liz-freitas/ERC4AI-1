# frozen_string_literal: true

class Erc4aiMultilabelService < ApplicationService
  def initialize(texts)
    @texts = [texts] if texts.is_a?(String)
    @texts ||= texts
    @texts ||= []
  end

  def call
    command = ['python3', 'app/python/services/erc4ai_multilabel_service.py', *@texts]
    stdout, stderr, status = Open3.capture3(*command)

    if status.success?
      prediction = stdout.split("\n\n").map { |p| p.split("\n")[1..] }
      
      @texts.each_with_index.map do |text, i|
        {
          text: text,
          labels: prediction[i]
        }
      end
    else
      raise "Command failed with error: #{stderr}"
    end
  end
end
