# frozen_string_literal: true

module Mutations
  module Organizations
    class OrganizationUpdate < BaseMutation
      description "Updates a organization by id"
  
      field :organization, Types::OrganizationType, null: false
  
      argument :id, ID, required: true
      argument :organization_input, Types::Inputs::OrganizationInputType, required: true
  
      def resolve(id:, organization_input:)
        organization = ::Organization.find(id)
        raise GraphQL::ExecutionError.new "Error updating organization", extensions: organization.errors.to_hash unless organization.update(**organization_input)
  
        { organization: organization }
      end
    end
  end
end
