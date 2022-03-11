# frozen_string_literal: true

module UuidGenerator
  extend ActiveSupport::Concern

  included do
    before_create :generate_uuid
  end

  # Generate UUID record in model with name "id"
  def generate_uuid
    self.id = loop do
      random_id = SecureRandom.uuid
      break random_id unless self.class.exists?(id: random_id)
    end
  end
end
