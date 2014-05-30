require 'spec_helper'

describe User do

  it { should respond_to(:email) }
  it { should respond_to(:first_name) }
  it { should respond_to(:full_name) }
  # it { should respond_to(:gplus) }
  it { should respond_to(:last_name) }
  it { should respond_to(:role) }
  # it { should respond_to(:twitter_handle) }

  describe "full_name" do
    it "should return a concatination of a user's first and last names" do
      user = create(:user)
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}

    context "role" do
      it "should allow valid roles" do
        %w(admin author).each do |valid_role|
          user_with_valid_role = build(:user, role: valid_role)
          expect(user_with_valid_role).to be_valid
          expect(user_with_valid_role.errors[:role]).to eq []
        end
      end

      it "should not allow false roles" do
        bad_role = build(:user, role: "invalid")
        expect(bad_role).to_not be_valid
        expect(bad_role.errors[:role]).to_not be nil
      end
    end

    # context "twitter handle" do
    #   it "should start with an @ symbol" do
    #     bad_twitter_handle = build(:user, twitter_handle: "someone.somewhere")
    #     expect(bad_twitter_handle).to_not be_valid
    #     expect(bad_twitter_handle.errors[:twitter_handle]).to_not be nil
    #   end
    # end

  end

end
