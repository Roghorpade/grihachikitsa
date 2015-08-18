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
			flash[:notice] = 'Appointment created. Pending Confirmation.'
			redirect_to appointment_path(@appointment)
	    else
	    	redirect_to root_path
	    end
	end

	private

	def appointment_params
		params.require(:appointment).permit(:time, :reason)
	end
end
