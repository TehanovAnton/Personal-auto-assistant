# frozen_string_literal: true

class CarsOwnersDocument < ApplicationRecord
  belongs_to :user
  belongs_to :document

  validates :issue_date, presence: true
  validate :earlier_than_now?

  private

  def earlier_than_now?
    errors.add(:issue_date, 'Document issue date nust be earlier than now') unless issue_date < Time.current.to_date
  end
end
