# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {

:address => 'smtp.sendgrid.net',
:port => 587,
:authentication => :plain,
:user_name => 'apikey',
:password => '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',
:domain => 'heroku.com',
:enable_starttls_auto => true

}