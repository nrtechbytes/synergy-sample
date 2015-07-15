class Wordpress

	include HTTParty

	base_uri Constants.wordpress_base_uri

	def initialize
		@options = { query: {context: 'display', number: Constants.posts_count} }
	end

	def posts
		posts_url = Constants.wordpress_rest_uri + '/sites/' + Constants.wordpress_blog_site_id + "/posts"
		puts posts_url
		self.class.get(posts_url, @options)

		# posts = self.class.get('/rest/v1.1/sites/81038511/posts/', @options)
		# puts " ********** MODEL *******"
		# puts posts

	end
end