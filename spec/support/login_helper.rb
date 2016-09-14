module LoginHelper
  include Warden::Test::Helpers
  Warden.test_mode!

  def login(user = nil )
    user = FacroryGirl.create(:user) if user.nil?
    login_as(user, scope: :user)
    user
  end
end

RSpec.configure do |config|
  config.include LoginHelper
end
