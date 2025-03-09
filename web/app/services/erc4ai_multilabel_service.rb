# frozen_string_literal: true

class Erc4aiMultilabelService < ApplicationService
  def initialize(texts)
    @texts = [texts] if texts.is_a?(String)
    @texts ||= texts
    @texts ||= []
  end

  def call
    prediction = `python3 app/python/services/erc4ai_multilabel_service.py "#{@texts.join('" "')}"`
    prediction = prediction.split("\n\n").map { |p| p.split("\n")[1..] }

    
    @texts.each_with_index.map do |text, i|
      {
        text: text,
        labels: prediction[i]
      }
    end
  end
end
