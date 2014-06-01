require "spec_helper"

describe Admin::UsersController do
  let(:valid_user) { attributes_for(:user) }
  let(:user) { User.create(valid_user.merge({role: "admin"})) }

  describe "routing" do

    it "routes to #dashboard" do
      expect(get("/a/dashboard")).to route_to("admin/users#dashboard")
    end

    # pending "routes to #new" do
    #   expect(get("/a/users/new")).to route_to("admin/users#new")
    # end

    # pending "routes to #show" do
    #   expect(get("/a/users/1")).to route_to("admin/users#show", id: "1")
    # end

    it "routes to #edit" do
      expect(get("/a/users/1/edit")).to route_to("admin/users#edit", id: "1")
    end

    # pending "routes to #create" do
    #   expect(post("/a/users")).to route_to("admin/users#create")
    # end

    it "routes to #update" do
      expect(put("/a/users/1")).to route_to("admin/users#update", id: "1")
    end

    # it "routes to #destroy" do
    #   expect(delete("/a/users/1")).to route_to("admin/users#destroy", id: "1")
    # end

  end
end
