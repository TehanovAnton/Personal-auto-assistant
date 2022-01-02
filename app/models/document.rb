class Document < ApplicationRecord
  enum name: {
    license: 0,
    insurence: 1
  }

  has_many :car_owner_documents, dependent: :destroy
  has_many :users, through: :car_owner_documents
end
