# frozen_string_literal: true

module Mutations
  module Organizations
    class OrganizationCreate < BaseMutation
      description "Creates a new organization"
  
      field :organization, Types::OrganizationType, null: false
  
      argument :organization_input, Types::Inputs::OrganizationInputType, required: true
  
      def resolve(organization_input:)
        organization = ::Organization.new(**organization_input)
        raise GraphQL::ExecutionError.new "Error creating organization", extensions: organization.errors.to_hash unless organization.save
  
        { organization: organization }
      end
    end
  end
end
