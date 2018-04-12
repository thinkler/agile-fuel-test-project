RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.start
    FactoryBot.reload
  ensure
    DatabaseCleaner.clean
  end
end
