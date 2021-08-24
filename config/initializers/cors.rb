# frozen_string_literal: true

# cors gives the ability to white list certain domains
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://tri-tracker.herokuapp.com/' # for production
    resource '*', headers: :any, methods: %i[get post put patch delete head options], credentials: true # allows
  end
end
