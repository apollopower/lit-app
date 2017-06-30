class UsersController < ApplicationController
	before_action :find_user, only: [:show,:update]

	def show
	end

  def update
	  if @user.update!(user_params)
	    redirect_to usersprofile_path
	  else
	    redirect_to editusersprofile_path
	  end
	end

  def view
  end



  private

  def user_params
  	params.permit(:bio, :skills, :github, :linkedin, :twitter)
  end

	def find_user
		@user = User.find(params[:id])
	end
end
