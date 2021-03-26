Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost.com:3000, localhost.com'
    resource '*', headers: :any, methods: [:post, :patch, :put]
  end
end

# SEE for options
# https://github.com/cyu/rack-cors#rails-configuration

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins '*'
#     resource '*', headers: :any, methods: [:get, :post, :patch, :put]
#   end
# end

# config.middleware.insert_before 0, "Rack::Cors" do
#   allow do
#     origins 'localhost.com:3000, localhost.com'
#     resource '*', :headers => :any, :methods => [:save, :create, :new]
#   end
# end