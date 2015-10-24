class UsersController < ApplicationController

   def index
      @users = User.all
   end

   def new
      @user = User.new
   end

   def create
      @user = User.create(user_params)
      #find user if create was successful
      createdUser = User.find_by_id(@user.id)
      if createdUser
         login(@user)
         redirect_to "/users/#{@user.id}"
      else
         redirect_to "/users/new"
      end
   end

   def show
      @user = User.find(params[:id])

      @current_user = current_user
   end

   def edit
   end

   def update
   end

   def destroy
   end

   private

   def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
   end

end


# def show
#   @user = User.find(params[:id])
#   @submissions = @user.submissions
#   @submissions = @submissions.order("created_at DESC")
#   @user_edits = @user.edits
#
#   @current_user = current_user
# end
#
#
# def create
#
#    @user = User.create(user_params)
#    #find user if create was successful
#    createdUser = User.find_by_id(@user.id)
#    if createdUser
#       login(@user)
#       redirect_to "/users/#{@user.id}"
#    else
#       redirect_to "/users/new"
#    end
# end
#
# def edit
#    current_user
#    id = params[:id]
#    @user = User.find_by_id(id)
#    render :edit
# end
#
# def update
#    user_id = params[:id]
#    @user = User.find_by_id(user_id)
#    updated_attributes = params.require(:user).permit(:username, :first_name, :last_name, :pseudonym, :password)
#
#    @user.update_attributes(updated_attributes)
#
#    @user.save
#
#    redirect_to "/users/#{user_id}"
# end
#
# def destroy
# end
#
# private
#
# def user_params
#    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
# end
