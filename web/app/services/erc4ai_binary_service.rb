# frozen_string_literal: true

class Erc4aiBinaryService < ApplicationService
  def initialize(texts)
    @texts = [texts] if texts.is_a?(String)
    @texts ||= texts
    @texts ||= []
  end

  def call
    prediction = Python.erc4ai_binary_service.predict(@texts)
    
    @texts.each_with_index.map do |text, i|
      {
        text: text,
        prediction: prediction[0][i] == 1,
      }
    end
  end
end
