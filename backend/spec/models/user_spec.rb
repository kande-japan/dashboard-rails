require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without name' do
    user = User.new(
      email: 'test@example.com',
      password: 'testtest'
    )

    expect { user.save! }.to raise_error ActiveRecord::NotNullViolation
  end

  it 'is valid with name' do
    user = User.new(
      email: 'test@example.com',
      name: 'Taro',
      password: 'testtest'
    )
    expect { user.save! }.not_to raise_error
  end

  it "is invalid when email doesn't match the mail regexp" do
    user = User.new(
      email: 'example0982',
      name: 'Taro',
      password: 'testtest'
    )
    expect(user.save).to be_falsy
  end

  it 'has unique password_digest even if their passwords are same' do
    user1 = User.create!(
      email: 'test1@example.com',
      name: 'Taro',
      password: 'testtest'
    )
    user2 = User.create!(
      email: 'test2@example.com',
      name: 'Yuriko',
      password: 'testtest'
    )
    expect(user1.password_digest).not_to eq user2.password_digest
  end
end
