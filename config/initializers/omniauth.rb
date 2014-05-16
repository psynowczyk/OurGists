OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "579777852130347", "e439a024ca7cdc5b6a0e95494cff73db"
    provider :github, ENV["GH_KEY"], ENV["GH_SEC"]
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
