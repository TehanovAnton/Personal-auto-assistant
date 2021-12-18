# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  enum role: { car_owner: 0,
               service_owner: 1,
               admin: 2 }

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :first_name, :last_name, length: { in: 2..30 }
  validates :role, inclusion: { in: %w[car_owner service_owner admin] }

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist

    unless user
      password = Devise.friendly_token[0, 20]

      user = User.create(
        first_name: data['first_name'],
        last_name: data['last_name'],
        email: data['email'],
        phone_number: '1234',
        password: password,
        provider: access_token.provider,
        uid: access_token.uid
      )
    end

    binding.pry

    user
  end
end
