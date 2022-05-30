
module Resolvers
  module UserResolvers
    def user(id:)
      User.find(id)
    end
  
    def users
      User.all
    end
  end
end
