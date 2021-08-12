# cors gives the ability to white list certain domains
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origin "http://localhost:3000"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :head], credentials: true #allows
  end

  allow do
    origin "https://tritracker.netlify.app" #for production
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :head], credentials: true #allows
  end
end