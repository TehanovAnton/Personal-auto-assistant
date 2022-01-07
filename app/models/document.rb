# frozen_string_literal: true

class Document < ApplicationRecord
  has_many :car_owner_documents, dependent: :destroy
  has_many :users, through: :car_owner_documents

  enum name: { license: 0, insurance: 1 }

  validates :name, presence: true, inclusion: { in: Document.names.keys }
end
