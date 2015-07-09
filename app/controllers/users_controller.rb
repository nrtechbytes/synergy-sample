class UsersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
	end

	def assign_as_admin
		User.assign_as_admin(params[:id])
		flash[:success] =  "Successfully assigned user as admin"
		redirect_to users_path
	end

	def unassign_as_admin
		User.unassign_as_admin(params[:id])
		flash[:success] =  "Successfully un-assigned user as admin"
		redirect_to users_path
	end

	private
	def authenticate_admin!
		unless current_user.try(:admin?)
      		flash[:danger] = 'You must be an admin to access this section'
      		redirect_to root_path # halts request cycle
    	end
    end	

end