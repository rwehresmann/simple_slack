require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

RSpec.configure do |config|
  config.include Warden::Test::Helpers
end

Capybara.server do |app, port|
  require 'puma'
  Puma::Server.new(app).tap { |server|
    server.add_tcp_listener(Capybara.server_host, port)
  }.run.join
end

Capybara.javascript_driver = :poltergeist
