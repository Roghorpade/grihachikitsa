class UsersController < ApplicationController
	before_filter :set_user, only: [:show]
    before_filter :check_authorization, only: [:show]

	def show
	end

	private

	  def set_user
	  	@user = User.find(params[:id])
	  end

	  def check_authorization
	  	unless current_user == @user || current_user.has_role?(:admin)
	  		flash[:alert] = 'Admin access only.'

			redirect_to root_path
	    end
	  end
end
