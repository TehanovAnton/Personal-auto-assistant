# frozen_string_literal: true

# == Schema Information
#
# Table name: documents
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :integer          default("license"), not null
#
class Document < ApplicationRecord
  has_many :car_owner_documents, dependent: :destroy
  has_many :users, through: :car_owner_documents

  enum name: { license: 0, insurance: 1 }

  validates :name, presence: true, inclusion: { in: Document.names.keys }
end
