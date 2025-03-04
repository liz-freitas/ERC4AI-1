class Requirement < ApplicationRecord
  belongs_to :session, foreign_key: :session_uuid, primary_key: :uuid

  normalizes :content, with: -> content { content.strip }
end
