# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

require 'rack/reverse_proxy'

use Rack::ReverseProxy do
	reverse_proxy_options preserve_host: true
  reverse_proxy /^\/blog$/, 'https://nrtechbytes.wordpress.com', :username => 'nrthinks', :password => 'nrdolly2', :timeout => 500, :preserve_host => true
end

run Rails.application
