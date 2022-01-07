# frozen_string_literal: true

class User < ApplicationRecord
  has_many :cars_owners_documents, dependent: :destroy
  has_many :documents, through: :cars_owners_documents

  has_many :comments, dependent: :destroy

  has_many :cars, dependent: :destroy

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
    user = user_by_email(data['email'])

    return create_user(data, access_token) unless user

    user
  end

  def document_issue_date(id:)
    cars_owners_documents.find_by(document_id: id).issue_date
  end

  def set_document_issue_date(id:, value:)
    cars_owners_documents.find_by(document_id: id).update(issue_date: value)
  end

  def self.create_user(data, access_token)
    password = Devise.friendly_token[0, 20]

    User.create(
      first_name: data['first_name'],
      last_name: data['last_name'],
      email: data['email'],
      phone_number: '1234',
      password: password,
      provider: access_token.provider,
      uid: access_token.uid
    )
  end

  def self.user_by_email(email)
    User.find_by(email: email)
  end

  def all_documents?
    documents.count == Document.count
  end
end
