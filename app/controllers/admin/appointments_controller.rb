class Admin::AppointmentsController < AdminController
	def index
		@appointments = Appointment.all
	end

	def confirm
		@appointment = Appointment.find(params[:id])

		if @appointment.update_attributes(confirmed: true)
			flash[:notice] = "Appointment number #{@appointment.id} has been confirmed."

		    redirect_to admin_appointments_path
	    else
	    	flash[:alert] = 'Error has been occured.'
	    end	
	end

	def cancel
		@appointment = Appointment.find(params[:id])

		if @appointment.update_attributes(confirmed: false)
		    flash[:notice] = "Appointment number #{@appointment.id} has been canceled."

		    redirect_to admin_appointments_path
		else
		    flash[:alert] = 'Error has been occured.'
		end
	end
end
