class Admin::AppointmentsController < AdminController
	def index
		@appointments = Appointment.all
	end

	def confirmed_index
		@appointments = Appointment.where(confirmed: true)
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def confirm
		@appointment = Appointment.find(params[:id])

		if @appointment.update_attributes(confirmed: true)
			flash[:notice] = "Appointment number #{@appointment.id} confirmed."

		    redirect_to admin_appointments_path
	    else
	    	flash[:alert] = 'Error occured.'
	    end	
	end

	def cancel
		@appointment = Appointment.find(params[:id])

		if @appointment.update_attributes(confirmed: false)
		    flash[:notice] = "Appointment number #{@appointment.id} canceled."

		    redirect_to admin_appointments_path
		else
		    flash[:alert] = 'Error occured.'
		end
	end

	def upload_result
		@appointment = Appointment.find(params[:id])
		@result = @appointment.result || Result.create(appointment: @appointment)
	end

	def upload
		@appointment = Appointment.find(params[:id])
		@result = @appointment.result
		@result.update(result_params)

		redirect_to [:admin, @appointment]
	end

	def assign_doctor
		@appointment = Appointment.find(params[:id])
		@appointment.update_attributes(appointment_params)
		# Send a notification to the android device
		puts @appointment.doctors.collect(&:id)
		@appointment.doctors.each do |doctor|
			@appointment.notifications.create(user_id: @appointment.user_id, doctor_id: doctor.id)
		end
		redirect_to [:admin, @appointment]
	end

	private

	def result_params
		params.require(:result).permit(:document)
	end

	def appointment_params
		params.permit(doctor_ids: [])
	end
end
