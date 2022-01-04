class CarsOwnersDocument < ApplicationRecord
  belongs_to :user
  belongs_to :document

  validates :issue_date, presence: true, if: -> { issue_date > Time.current.to_date }
end
