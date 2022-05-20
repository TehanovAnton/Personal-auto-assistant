# frozen_string_literal: true

# == Schema Information
#
# Table name: works
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
require 'elasticsearch/model'

class Work < ApplicationRecord
  include Elasticsearch::Model

  has_many :organizations_works, dependent: :destroy
  has_many :organizations, through: :organizations_works

  belongs_to :category

  validates :title, presence: true, uniqueness: true

  def price_in_organization(organization_id)
    organizations_works.find_by(organization_id: organization_id, work_id: id).price
  end
end

Work.__elasticsearch__.create_index!
Work.import
