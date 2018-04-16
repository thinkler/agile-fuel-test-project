module JsonHelper
  def response_body
    (lambda do
      JSON.parse(response.body, symbolize_names: true)
    end).call
  end
end

RSpec.configure do |config|
  config.include JsonHelper
end
