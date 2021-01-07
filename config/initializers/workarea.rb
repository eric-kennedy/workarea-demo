Workarea.configure do |config|
  # Basic site info
  config.site_name = 'Demo'

  config.host = {
    'test' => 'www.example.com',
    'development' => 'localhost',
    'production' => 'www.demo.com' # TODO
  }[Rails.env]
end
