module ApiAuthHelper
  def auth_request(user)
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end
end

RSpec.configure do |config|
  config.include ApiAuthHelper
end
