OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV["FB_KEY"], ENV["FB_SEC"]
    provider :github, ENV["GH_KEY"], ENV["GH_SEC"]
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
