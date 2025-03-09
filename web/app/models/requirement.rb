class Requirement < ApplicationRecord
  belongs_to :session, foreign_key: :session_uuid, primary_key: :uuid

  normalizes :content, with: -> content { content.strip }

  serialize :erc4ai_classes, type: Array, coder: JSON

  enum :status, { pending: 0, running_classification: 1, classified: 2, error: 3 }

  validates :content, presence: true, length: { maximum: 1000 }

  # Stream to turbo-stream
  after_update_commit { broadcast_update_to "#{session_uuid}/requirements", target: "requirement_#{id}", partial: "requirements/requirement", locals: { requirement: self } }

  def run_binary_classification
    self.ethic = Erc4aiBinaryService.new(content).call.first[:prediction]
    
    Rails.logger.info("Requirement #{id} has been classified as #{ethic}")

    save
  end

  def run_multilabel_classification
    self.erc4ai_classes = Erc4aiMultilabelService.new([content]).call.first&.fetch(:labels, [])
    
    Rails.logger.info("Requirement #{id} has been classified as #{erc4ai_classes}")

    save
  end
end
