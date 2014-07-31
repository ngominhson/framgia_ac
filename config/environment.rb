# Load the rails application
require File.expand_path('../application', __FILE__)

Rails.application.initialize!
Rails.configuration.action_mailer.default_url_options = { :host => "localhost:3000" }