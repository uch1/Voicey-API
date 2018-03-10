require 'rails_helper'

RSpec.describe "UserControllers", type: :request do
  describe "GET /user_controllers" do

    context "unauthorized" do

      before {
        get "/users"
      }

      it "fails when there is no authentication" do
        expect(response).to_not be_success
      end

    end

    context "authorized" do

      before {
        user = User.new(
          name: "Uchenna",
          email: "uchenna@test.com",
          password: "test123"
        )

        user.save

        # Compose token for request
        full_token = "Token token=#{user.token}"

        get "/users", headers: { 'Authorization' => full_token }
      }

      it "succeeds when there is authentication" do
        expect(response).to be_success
      end

    end

  end

  # Test signing up a user
  describe "POST /user_controllers" do

    context "valid params" do

      before {
        valid_params = {name: "Uchenna", email: "uchenna@test.com", password: "test123"}
        post "/users", params: valid_params
      }

      it "creates and sends success of creating a user with valid params" do
        expect(response).to be_success
      end

    end

    context "invalid params" do

      before {
        invalid_params = {email: "uchenna@test.com", password: "test123"}
        post "/users", params: invalid_params
      }

      it "should fail and send 400" do
        expect(response).to_not be_success
      end

    end

  end
end

























# require 'rails_helper'
#
# RSpec.describe User, type: :model do
#
#   describe "Validations" do
#     it "is valid with valid attributes" do
#       user = User.new(name: "Uchenna", email: "uchenna@test.com", password: "test123")
#       expect(user).to be_valid
#     end
#
#     it "is invalid without a name" do
#       bad_user = User.new(name: nil, email: "uchenna@test.com", password: "test123")
#       expect(bad_user).to_not be_valid
#     end
#
#     it "is invalid without an email" do
#       bad_user = User.new(name: "Uchenna", email: nil, password: "test123")
#       expect(bad_user).to_not be_valid
#     end
#
#     it "is invalid without a password" do
#       bad_user = User.new(name: "Uchenna", email: "uchenna@test.com", password: nil)
#       expect(bad_user).to_not be_valid
#     end
#     # TODO: Do I need to inlcude this validation
#     it "is invalid without a email and password" do
#       bad_user = User.new(name: "Uchenna", email: nil, password: nil)
#       expect(bad_user).to_not be_valid
#     end
#   end
#
#   describe "Associations" do
#     it "should have many memos" do
#       assoc = User.reflect_on_association(:memos)
#       expect(assoc.macro).to eq :has_many
#     end
#   end
#
# end
