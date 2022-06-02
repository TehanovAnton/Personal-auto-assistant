
module Types
  class WorkType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :category_id, Integer, null: false
  end  
end
