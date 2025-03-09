class ClassifyRequirementJob < ApplicationJob
  queue_as :default

  def perform(requirement_id, classification_type)
    requirement = Requirement.find(requirement_id)

    requirement.running_classification!

    if classification_type == "binary"
      requirement.run_binary_classification
    elsif classification_type == "multilabel"
      requirement.run_multilabel_classification
    end

    requirement.classified!
  rescue StandardError => e
    requirement.error!
    Rails.logger.error("Error classifying requirement #{requirement_id}: #{e.message}")
    raise e
  end
end
