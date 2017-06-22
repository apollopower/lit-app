class UsersController < ApplicationController

	def show
    @user = User.find(params[:id])
	end

  def update
    @user = User.find(params[:id])
		# @user = current_user

  if @user.update!(user_params)
    redirect_to usersprofile_path
  else
    # redirect_to account_path
    redirect_to editusersprofile_path

  end
end

  def view
     
  end



  private

  def user_params
  	params.permit(:bio, :skills, :links)
  end
end

