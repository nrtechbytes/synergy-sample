# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

require 'rack/reverse_proxy'

use Rack::ReverseProxy do

	reverse_proxy_options preserve_host: true
  reverse_proxy /^\/blog(\/.*)$/, 'https://nrtechbytes.wordpress.com/$1',username: 'nrthinks', password: 'sD5&u&*kf6etU9u8A27PF3v&e^$7jE!2s', :timeout => 500, :preserve_host => true, :append_path => true
	reverse_proxy_options preserve_host: true
  reverse_proxy /^\/blog$/, 'https://nrtechbytes.wordpress.com',username: 'nrthinks', password: 'sD5&u&*kf6etU9u8A27PF3v&e^$7jE!2s', :timeout => 500, :preserve_host => true, :append_path => false
end

run Rails.application
