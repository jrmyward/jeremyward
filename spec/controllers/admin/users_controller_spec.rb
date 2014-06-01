require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Admin::UsersController do
  let(:valid_attributes) { FactoryGirl.attributes_for(:user, first_name: "Tony", last_name: "Stark") }
  let(:valid_user) { FactoryGirl.attributes_for(:user) }
  let(:user) { User.create(valid_user.merge({role: "admin"})) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

    # describe "GET index" do
    #   it "assigns all users as @users" do
    #     user = User.create! valid_attributes
    #     get :index, {}
    #     assigns(:users).should eq([user])
    #   end
    # end

    # describe "GET show" do
    #   it "assigns the requested users as @users" do
    #     user = User.create! valid_attributes
    #     get :show, {:id => user.to_param}
    #     assigns(:users).should eq(user)
    #   end
    # end

  # describe "GET new" do
  #   it "assigns a new users as @users" do
  #     get :new, {}
  #     assigns(:users).should be_a_new(User)
  #   end
  # end

  describe "GET edit" do
    it "assigns the requested users as @users" do
      get :edit, {:id => user.id}
      assigns(:user).should eq(user)
    end
  end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new User" do
  #       expect {
  #         post :create, {:users => valid_attributes}
  #       }.to change(User, :count).by(1)
  #     end

  #     it "assigns a newly created users as @users" do
  #       post :create, {:users => valid_attributes}
  #       assigns(:users).should be_a(User)
  #       assigns(:users).should be_persisted
  #     end

  #     it "redirects to the created users" do
  #       post :create, {:users => valid_attributes}
  #       response.should redirect_to(User.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved users as @users" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       User.any_instance.stub(:save).and_return(false)
  #       post :create, {:users => {  }}
  #       assigns(:users).should be_a_new(User)
  #     end

  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       User.any_instance.stub(:save).and_return(false)
  #       post :create, {:users => {  }}
  #       response.should render_template("new")
  #     end
  #   end
  # end

  describe "PUT update" do
    before(:each) do
      @valid_params = {
        first_name: "Steven",
        current_password: valid_user[:password]
      }
    end
    describe "with valid params" do
      it "updates the requested users" do
        put :update, {:id => user.id, :user => @valid_params}
      end

      it "assigns the requested users as @user" do
        put :update, {:id => user.id, :user => @valid_params}
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        put :update, {:id => user.id, :user => @valid_params}
        response.should redirect_to(edit_user_path(user))
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.id, :user => @valid_params}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.id, :user => @valid_params}
        response.should render_template("edit")
      end
    end

  end

  # describe "DELETE destroy" do
  #   it "destroys the requested user" do
  #     user = User.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => user.to_param}
  #     }.to change(User, :count).by(-1)
  #   end

  #   it "redirects to the user list" do
  #     user = User.create! valid_attributes
  #     delete :destroy, {:id => user.to_param}
  #     response.should redirect_to(users_url)
  #   end
  # end

end