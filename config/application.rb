require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FramgiaAc
  class Application < Rails::Application

    config.action_mailer.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,
      :domain               => "gmail.com",  
      :user_name            => "framgiatest",  
      :password             => "framgia123456",  
      :authentication       => "plain",  
      :enable_starttls_auto => true  
    }
  end
end
