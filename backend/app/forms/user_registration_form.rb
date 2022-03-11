# frozen_string_literal: true

class UserRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :password, :string

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :email_is_not_taken_by_another

  def save
    return false if invalid?

    user.save!
    true
  end

  def user
    @user ||= User.new(
      name: name,
      email: email,
      password: password
    )
  end

  private

  def email_is_not_taken_by_another
    errors.add(:email, :taken, value: email) if User.exists?(email: email)
  end
end
