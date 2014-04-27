Recaptcha.configure do |config|
    config.public_key  = ENV["RE_CAPTCHA_KEY"]
    config.private_key = ENV["RE_CAPTCHA_SEC"]
end
