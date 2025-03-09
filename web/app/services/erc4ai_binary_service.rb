# frozen_string_literal: true

class Erc4aiBinaryService < ApplicationService
  def initialize(texts)
    @texts = [texts] if texts.is_a?(String)
    @texts ||= texts
    @texts ||= []
  end

  def call
    prediction = `python3 app/python/services/erc4ai_binary_service.py "#{@texts.join('" "')}"`
    prediction = prediction.split("\n\n").map { |p| p.split("\n").last }
    
    @texts.each_with_index.map do |text, i|
      {
        text: text,
        prediction: prediction[i] == '1',
      }
    end
  end
end
