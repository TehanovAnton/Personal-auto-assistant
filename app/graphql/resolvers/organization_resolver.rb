# frozen_string_literal: true

module Resolvers
  class OrganizationResolver < Resolvers::BaseResolver
    description 'organization'

    type Types::OrganizationType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Organization.find(id)
    end
  end
end
