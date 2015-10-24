class User < ActiveRecord::Base

   validates :first_name, :last_name, :email, :password, presence: true
	validates :email, uniqueness: true
	has_secure_password


   def self.confirm(params)
      p params
      email_param = params[:email]
      password_param = params[:password]
      user = User.find_by_email(email_param)
      user.authenticate(password_param)
   end

end
