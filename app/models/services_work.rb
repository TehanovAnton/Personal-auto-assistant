# frozen_string_literal: true

# == Schema Information
#
# Table name: services_works
#
#  id         :bigint           not null, primary key
#  service_id :bigint           not null
#  work_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ServicesWork < ApplicationRecord
  belongs_to :service
  belongs_to :work
end
