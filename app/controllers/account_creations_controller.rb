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
					session[:accounts_count] = params[:accounts_count].to_i
					session[:accounts_count].each do |i|
					  instance_variable_set("@user#{i+1}") = @user.account.build
					end
				else
					skip_step
				end
			end
		when :accounts_info
			bindin
		end

		render_wizard(@user)
	end

	def create
		binding.pry
	end

	private

	def account_creations_params
	end
end
