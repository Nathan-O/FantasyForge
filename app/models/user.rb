class User < ActiveRecord::Base
   validates :first_name, :last_name, :email, :password, presence: true
	validates :email, uniqueness: true
	has_secure_password

   has_many :maps
   has_many :versions


   def self.confirm(params)
      puts params
      email_param = params[:email]
      password_param = params[:password]
      puts password_param
      @user = User.find_by_email(email_param)
      puts @user
      @user.authenticate(password_param)
   end

end
