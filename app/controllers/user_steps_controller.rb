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
		@user.steps_passed = true

		render_wizard @user
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :date_of_birth, :mobile_number, :gender)
	end

	def finish_wizard_path
		new_appointment_path
	end
end
