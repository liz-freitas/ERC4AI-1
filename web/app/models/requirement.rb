class Requirement < ApplicationRecord
  belongs_to :session, foreign_key: :session_uuid, primary_key: :uuid

  normalizes :content, with: -> content { content.strip }

  after_create :evaluate_ethical_requirement

  private

  def evaluate_ethical_requirement
    update(
      ethic: Erc4aiBinaryService.new([content]).call.first[:prediction]
    )
  end
end
