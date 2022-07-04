# frozen_string_literal: true

module Mutations
  module Organizations
    class OrganizationDelete < BaseMutation
      description 'Deletes a organization by ID'

      field :organization, Types::OrganizationType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        organization = ::Organization.find(id)
        unless organization.destroy
          raise GraphQL::ExecutionError.new 'Error deleting organization',
                                            extensions: organization.errors.to_hash
        end

        { organization: organization }
      end
    end
  end
end
