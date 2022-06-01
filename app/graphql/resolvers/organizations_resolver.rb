# frozen_string_literal: true

module Resolvers
  class OrganizationsResolver < Resolvers::BaseResolver
    description 'organizations'

    type [Types::OrganizationType], null: false

    def resolve
      Organization.all
    end
  end
end
