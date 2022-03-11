# frozen_string_literal: true

module UUIDGenerator
  def self.included(klass)
    klass.before_create :generate_uuid
  end

  # Generate UUID record in model with name "id"
  def generate_uuid
    self.id = loop do
      random_id = SecureRandom.uuid
      break random_id if self.class.empty?(id: random_id)
    end
  end
end
