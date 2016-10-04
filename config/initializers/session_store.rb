# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_spekulooz_session', :domain => :all

# FROM http://stackoverflow.com/questions/6301121/rails-how-can-i-share-permanent-cookies-across-multiple-subdomains

if Rails.env.production?
  Rails.application.config.session_store :cookie_store, :key => '_app_name_session', :domain => '.spekulooz.be'
else
  Rails.application.config.session_store :cookie_store, :key => '_app_name_session', :domain => '.lvh.me:3000'
end

# END FROM