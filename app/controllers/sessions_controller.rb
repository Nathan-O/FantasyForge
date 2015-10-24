class SessionsController < ApplicationController

   def new #login page
      @user = User.new
      render :new #check
   end

   def create
      userParams = params.require(:user).permit(:email, :password)
      @user = User.confirm(userParams)
      if @user
         login(@user)
         redirect_to profile_path(@user.id) #check
      else
         redirect_to "/sessions/new" #check
      end
   end

   def destroy #logout
      logout
      redirect_to root_path #check
   end
end
