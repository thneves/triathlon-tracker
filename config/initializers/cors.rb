# frozen_string_literal: true

# cors gives the ability to white list certain domains
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"
    resource "*",
      headers: :any,
      methods: [:get, :post, :delete, :head, :options],
      credentials: true #allows
  end

  allow do
    origins "https://tri-tracker.herokuapp.com/"
    resource "*",
      headers: :any,
      methods: [:get, :post, :delete, :head, :options],
      credentials: true #allows
  end
end
