# Be sure to restart your server when you modify this file.

if Rails.env.development?

	Rails.application.config.session_store :cookie_store, key: '_spekulooz_session', :domain => "lvh.me"

else

	Rails.application.config.session_store :cookie_store, key: '_spekulooz_session', :domain => :all


end




