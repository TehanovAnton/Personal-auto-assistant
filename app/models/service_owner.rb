class ServiceOwner < User
  default_scope { where(role: :service_owner) }
end
