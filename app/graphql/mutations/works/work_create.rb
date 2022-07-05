# frozen_string_literal: true

module Mutations
  module Works
    class WorkCreate < BaseMutation
      description 'Creates a new work'

      field :work, Types::WorkType, null: false

      argument :work_input, Types::Inputs::WorkInputType, required: true

      def resolve(work_input:)
        work = ::Work.new(**work_input)
        unless work.save
          raise GraphQL::ExecutionError.new 'Error creating work',
                                            extensions: work.errors.to_hash
        end

        { work: work }
      end
    end
  end
end
