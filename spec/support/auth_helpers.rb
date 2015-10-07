module AuthHelpers
  include Warden::Test::Helpers
  Warden.test_mode!

  def sign_in
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    user
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, :type => :feature
end