# frozen_string_literal: true

query_string = "
  user(id: 1) {
    id
    first_name
    last_name
    email
  }
"

Rails.logger.debug Schema.execute(query_string)
