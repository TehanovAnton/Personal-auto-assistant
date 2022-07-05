# frozen_string_literal: true

# == Schema Information
#
# Table name: cars_owners_documents
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  document_id      :integer          not null
#  issue_date       :date             default(Fri, 01 Jan 2021), not null
#  term_of_validity :integer          default(29), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class CarsOwnersDocument < ApplicationRecord
  belongs_to :user
  belongs_to :document

  delegate :name, to: :document

  validates :issue_date, presence: true
  validates :term_of_validity, numericality: { only_integer: true, greater_than: 28 }
  validate :earlier_than_now?

  private

  def earlier_than_now?
    return if issue_date < Time.current.to_date

    errors.add(:issue_date,
               'Document issue date nust be earlier than now')
  end
end
