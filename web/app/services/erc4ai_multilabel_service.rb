# frozen_string_literal: true

class Erc4aiMultilabelService < ApplicationService
  def initialize(texts)
    @texts = [texts] if texts.is_a?(String)
    @texts ||= texts
    @texts ||= []
  end

  def call
    labels = Python.erc4ai_multilabel_service.target_names
    prediction = Python.erc4ai_multilabel_service.predict(@texts)
    
    @texts.each_with_index.map do |text, i|
      {
        text: text,
        labels: labels.zip(prediction[0][i]).select { |_, v| v == 1 }.map(&:first)
      }
    end
  end
end
