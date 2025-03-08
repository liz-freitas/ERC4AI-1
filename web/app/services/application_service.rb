# frozen_string_literal: true

# ApplicationService
class ApplicationService
  def initialize(**, &)
    raise NotImplementedError, "You must implement #{self.class}#initialize"
  end

  def self.call(...)
    new(...).call
  end
end
