class Document < ApplicationRecord
  has_many :car_owner_documents, dependent: :destroy
  has_many :users, through: :car_owner_documents

  validates :name, presence: true
  validates :term_of_validity, numericity: { only_integer: true, greater_than: 28 }
end
