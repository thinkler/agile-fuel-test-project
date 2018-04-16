DeviseTokenAuth.setup do |config|
  config.enable_standard_devise_support = true
  config.change_headers_on_each_request = false
  config.check_current_password_before_update = true
end
