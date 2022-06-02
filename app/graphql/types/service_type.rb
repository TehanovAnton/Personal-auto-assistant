
module Types
  class ServiceType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :phone_number, String, null: false
    field :address, String, null: false
    field :organization_id, ID, null: false    
  end
end
