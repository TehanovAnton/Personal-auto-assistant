# frozen_string_literal: true

class Order < ApplicationRecord
  paginates_per 2

  belongs_to :services_work
  belongs_to :car

  has_many :comments, as: :commentable, dependent: :destroy

  delegate :work, :service, to: :services_work
  delegate :organization, to: :service
  delegate :user, to: :car

  def price
    OrganizationsWork.find_by(organization_id: organization.id, work_id: work.id).price
  end
end
