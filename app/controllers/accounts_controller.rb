class AccountsController < ApplicationController
	def index
	end

	def switch
		@account = Account.find(params[:account_id])

		session[:current_account] = @account
		flash[:success] = "You are logged in as #{@account.name}"
		
		redirect_to root_path
	end
end
