class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   acts_as_messageable

   # blogs

   scope :admin, -> { where(admin: true) }

   def self.assign_as_admin(user_id)
   		toggle_admin_status(user_id, true)
   end

   def self.unassign_as_admin(user_id)
   		toggle_admin_status(user_id, false)
   end

   def mailboxer_email(object)
   		email
   end

   # def username
   #  name
   # end

   private
   def self.toggle_admin_status(user_id, status)
   		user  = get_obj(user_id)
   		user.update_attribute :admin, status
   end

   def self.get_obj user_id
   		User.find(user_id)
   end
end
