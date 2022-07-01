# frozen_string_literal: true

module Mutations
  module Works
    class WorkUpdate < BaseMutation
      description "Updates a work by id"

      field :work, Types::WorkType, null: false

      argument :id, ID, required: true
      argument :work_input, Types::Inputs::WorkInputType, required: true

      def resolve(id:, work_input:)
        work = ::Work.find(id)
        raise GraphQL::ExecutionError.new "Error updating work", extensions: work.errors.to_hash unless work.update(**work_input)

        { work: work }
      end
    end
  end
end
