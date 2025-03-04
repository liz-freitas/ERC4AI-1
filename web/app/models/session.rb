class Session < ApplicationRecord
  self.primary_key = 'uuid'

  has_many :requirements, dependent: :destroy

  validates :uuid, presence: true, uniqueness: true

  before_validation :set_uuid, on: :create

  private

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
