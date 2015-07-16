class AdminController < ApplicationController
	before_filter :check_if_admin?

	private

	def check_if_admin?
		unless current_user.has_role? 'admin'
			flash[:alert] = 'You have no access to this page.'

			redirect_to root_path
		end
    end
end