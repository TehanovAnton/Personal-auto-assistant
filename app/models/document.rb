class Document < ApplicationRecord
  has_many :car_owner_documents, dependent: :destroy
  has_many :users, through: :car_owner_documents
end
