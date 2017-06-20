class UsersController < ApplicationController

	def show
		@users = User.all
	end

	def edit
    @user = current_user
  end

  def update
		@user = current_user

  if @user.update (user_params)
    redirect_to userprofile_path
  else
    redirect_to account_path
  end
end

private

def user_params
	params.permit(:bio, :skills)
end

end
