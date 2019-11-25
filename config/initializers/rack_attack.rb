# Throttle login attempts for a given email parameter to 6 reqs/minute
# Return the email as a discriminator on POST /login requests

Rack::Attack.throttle('logins/email', :limit => 6, :period => 60.seconds) do |req|
    req.params['email'] if req.path == '/' && req.post?
  end

  Rack::Attack.throttle("requests by ip", limit: 5, period: 2) do |request|
    request.ip
  end

 