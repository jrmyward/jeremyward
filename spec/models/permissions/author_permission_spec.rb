require "spec_helper"

describe Permissions::AuthorPermission do
  # let(:user) { build(:user, role: "author") }
  # let(:user_post) { build(:post, author_id: user.id) }
  # let(:other_post) { build(:post, author_id: 357) }
  # subject { Permissions.permission_for(user) }

  # it "allows comments" do
  #   should authorize(:comments, :index)
  #   should authorize(:comments, :new)
  #   should authorize(:comments, :create)
  #   should_not authorize(:comments, :edit)
  #   should_not authorize(:comments, :update)
  #   should_not authorize(:comments, :destroy)
  # end

  # it "allows list subscribers" do
  #   should authorize("subscribers", :create)
  #   should authorize("subscribers", :new)
  #   should_not authorize("subscribers", :show)
  #   should_not authorize("subscribers", :edit)
  #   should_not authorize("subscribers", :update)
  #   should_not authorize("subscribers", :destroy)
  #   should_not allow_param("subscribers", :sync)
  # end

  # it "allows posts" do
  #   should authorize(:posts, :index)
  #   should authorize(:posts, :show)
  #   should authorize(:posts, :new)
  #   should authorize(:posts, :create)
  #   should_not authorize(:posts, :edit)
  #   should_not authorize(:posts, :update)
  #   should_not authorize(:posts, :edit, other_post)
  #   should_not authorize(:posts, :update, other_post)
  #   should authorize(:posts, :edit, user_post)
  #   should authorize(:posts, :update, user_post)
  #   should_not authorize(:posts, :destroy)
  #   # should allow_param(:topic, :name)
  #   # should_not allow_param(:topic, :sticky)
  # end

  # it "allows sessions" do
  #   should authorize("devise/sessions", :new)
  #   should authorize("devise/sessions", :create)
  #   should authorize("devise/sessions", :destroy)
  # end


  # it "allows users" do
  #   should_not authorize("members/users", :new)
  #   should_not authorize("members/users", :create)
  #   should authorize("members/users", :edit)
  #   should authorize("members/users", :update)
  #   should_not authorize("members/users", :destroy)
  #   should_not allow_param(:user, :role)
  # end
end
