# frozen_string_literal: true

# define how the cookies structure will be like
if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_authentication_app', domain: "https://tri-tracker.herokuapp.com", same_site: 'none'
else
  Rails.application.config.session_store :cookie_store, key: '_authentication_app'
end
