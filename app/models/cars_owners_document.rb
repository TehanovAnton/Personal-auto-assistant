# frozen_string_literal: true

class CarsOwnersDocument < ApplicationRecord
  belongs_to :user
  belongs_to :document

  validates :issue_date, presence: true
  validates :term_of_validity, numericality: { only_integer: true, greater_than: 28 }
  validate :earlier_than_now?

  private

  def earlier_than_now?
    errors.add(:issue_date, 'Document issue date nust be earlier than now') unless issue_date < Time.current.to_date
  end
end
