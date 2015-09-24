class AppointmentsController < ApplicationController
	def index
		@appointments = Appointment.where(user: current_user)
	end

	def new
		@appointment = Appointment.new
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def create
		@appointment = Appointment.new(appointment_params)
		@appointment.user = current_user

		if @appointment.save
			flash[:notice] = "Appointment for #{@appointment.account.name} created. Time: #{@appointment.time}. Pending Confirmation."
	    end

	    sign_out current_user

	    redirect_to root_path
	end

	private

	def appointment_params
		params.require(:appointment).permit(:time, :reason, :account_id)
	end
end
