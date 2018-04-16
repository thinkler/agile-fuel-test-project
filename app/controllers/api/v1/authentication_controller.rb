module Api
  module V1
    class AuthenticationController < Api::V1::BaseApiController
      resource_description do
        short "User's authentication"
        description <<-DESCRIPTION
          == Authentication
          After success sign in user gets following headers in response:
            uid: A unique value that is used to identify the user (equal to user email)
            expiry: The date at which the current session will expire
            token-type: Shoul be 'Bearer'
            access-token: This serves as the user's password for each request
            client: This enables the use of multiple simultaneous sessions on different clients

          To change password, delete current session or get access to rewards these headers
          must be included in each request.
        DESCRIPTION
      end

      api :POST, '/auth/sign_in', 'Sign user in'
      param :email, String, "User's email", required: true
      param :password, String, "User's password", required: true
      def sign_in; end

      api :POST, '/auth/', 'Sign user up'
      param :email, String, "User's email", required: true
      param :password, String, "User's password", required: true
      def sign_up; end

      api :DELETE, '/auth/sign_out', 'Delete current session'
      def sign_out; end

      api :PUT, '/auth/', "Change user's password"
      param :email, String, "User's email", required: true
      param :current_password, String, "Old user's password", required: true
      param :password, String, "New user's password", required: true
      def change_passwrod; end
    end
  end
end
