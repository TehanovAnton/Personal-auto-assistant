# frozen_string_literal: true

class DocumentWorker
  include Sidekiq::Worker

  def perform
    CarsOwnersDocument.all.each do |el|
      differences_in_days = ((Time.current - el.issue_date.to_time) / 1.day).round

      if el.term_of_validity - differences_in_days < 2
        Orders::ClientMailer.with(user: el.user,
                                  document: el.document).document_end_term_of_validity.deliver_later
      end
    end
  end
end
