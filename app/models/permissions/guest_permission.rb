module Permissions
  class GuestPermission < BasePermission
    def initialize
      allow "devise/sessions", [:new, :create, :destroy]
      allow :comments, [:index, :new, :create]
      allow :content, [:index]
      allow :posts, [:index, :show]
      allow "list_subscribers", [:create, :confirm, :new]
      allow_param "list_subscriber", :first_name
      allow_param "list_subscriber", :email
    end
  end
end
