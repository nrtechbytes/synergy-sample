module MessagesHelper
	def recipients_options
		
		users = current_user.admin? ?
			User.all : User.admin

		s = ''
		users.each do |user|
			s << "<option value='#{user.id}'>#{user.name}</option>"
		end
		s.html_safe
	end
end