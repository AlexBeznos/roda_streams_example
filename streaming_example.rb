require "dotenv"
require "roda"
require "rack/csrf"

Dotenv.load

class StreamingExample < Roda
  use Rack::Session::Cookie, key: ENV["RACK_COOKIE_KEY"], secret: ENV["RACK_COOKIE_SECRET"]
  plugin :environments
  self.environment = ENV["ENVIRONMENT"]

  #plugin :csrf, raise: true
  plugin :multi_route
  plugin :request_headers
  plugin :all_verbs
  plugin :halt

  route(&:multi_route)

  Dir["./routes/*.rb"].each(&method(:require))
end
