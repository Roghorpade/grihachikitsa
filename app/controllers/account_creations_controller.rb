class AccountCreationsController < ApplicationController
	include Wicked::Wizard
	steps :accounts_count, :accounts_info

	def show
		@user = current_user

		render_wizard
	end

	def update
		@user = current_user

		case step
		when :accounts_count
			if params[:accounts_count].present?	
				if params[:accounts_count].to_i > 1
					params[:accounts_count].to_i.times { @user.accounts.build }
				else
					skip_step
				end
			end
		when :accounts_info
			@user.update_attributes(user_params)
		end

		render_wizard(@user)
	end

	private

	def user_params
		params.require(:user).permit(accounts_attributes: [:first_name, :last_name, :height, :date_of_birth,
			:mobile_number, :gender, :address])
	end
end
