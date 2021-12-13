class ServiceOwner < User
  after_initialize :default_role

  def self.all
    User.select { |user| user.role == service_owner_role }
  end

  private

  def default_role
    self.role = service_owner_role
  end

  def service_owner_role
    @default_role ||= 'service_owner'
  end
end
