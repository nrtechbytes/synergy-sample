class HomeController < ApplicationController

	def index
		wordpress = Wordpress.new
		@posts = wordpress.posts
		@site_domain = request.host_with_port
	end

end