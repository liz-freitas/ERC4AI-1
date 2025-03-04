class Session < ApplicationRecord
  self.primary_key = 'uuid'

  has_many :requirements, dependent: :destroy, foreign_key: :session_uuid, primary_key: :uuid

  validates :uuid, presence: true, uniqueness: true

  before_validation :set_uuid, on: :create

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
