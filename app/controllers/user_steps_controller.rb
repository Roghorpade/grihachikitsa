class UserStepsController < ApplicationController
	include Wicked::Wizard
	steps :personal_info

	def show
		@user = current_user
		render_wizard
	end

	def update
		@user = current_user

		@user.assign_attributes(user_params)
	    if params[:user][:want_to_create_multiple_accounts] == '1'
	    	want_to_create_multiple_accounts = true
	    else
	    	want_to_create_multiple_accounts = false
	    end
		session[:want_to_create_multiple_accounts] = want_to_create_multiple_accounts
		@user.steps_passed = true
		@user.save

		render_wizard @user
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :date_of_birth, :mobile_number, :gender, :address)
	end

	def finish_wizard_path
		if session[:want_to_create_multiple_accounts]
		  account_creations_path
		else
		  new_appointment_path
		end
	end
end
