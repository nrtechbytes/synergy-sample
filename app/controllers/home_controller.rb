class HomeController < ApplicationController

	def index
		wordpress = Wordpress.new
		@posts = wordpress.posts
	end

end