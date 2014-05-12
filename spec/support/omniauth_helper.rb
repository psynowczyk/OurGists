# spec/support/omniauth_helper.rb
module OmniauthHelper
  
  def login_with_oauth(provider = :facebook)
    redirect_to 'auth/:facebook/callback'
  end

  # spec/spec_helper.rb
  RSpec.configure do |config|
    config.include OmniauthHelper, :type => :controller
  end

end