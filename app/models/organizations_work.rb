# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations_works
#
#  id              :bigint           not null, primary key
#  organization_id :bigint           not null
#  work_id         :bigint           not null
#  price           :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class OrganizationsWork < ApplicationRecord
  belongs_to :organization
  belongs_to :work
end
