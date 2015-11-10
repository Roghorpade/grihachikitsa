class AppointmentsController < ApplicationController
	def index
		@appointments = Appointment.where(user: current_user)
	end

	def new
	  @appointment = Appointment.new

	  @users = [current_user] + User.with_role('doctor')
	  @users = @users.select { |user| user.longitude.present? && user.latitude.present? }

	  @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  		marker.lat user.latitude
  		marker.lng user.longitude
  		if user.has_role? ('doctor')
  			marker.picture({
  		  		"url" => "http://www.fancyicons.com/free-icons/103/pretty-office-6/png/32/doctor_32.png",
          		"width" =>  32,
          		"height" => 32
  			})
  		end

  		if user != current_user
  		end
      end
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def create
		@appointment = Appointment.new(appointment_params)
		@appointment.user = current_user

		if @appointment.save
			if current_user.accounts.present?
				flash[:notice] = "Appointment for #{@appointment.account.name} created. Time: #{@appointment.time}. Pending Confirmation."
	    	else
	    		flash[:notice] = "Appointment for #{current_user.name} created. Time: #{@appointment.time}. Pending Confirmation."
	    	end
	    end

	    redirect_to user_path(current_user)
	end

	private

	def appointment_params
		params.require(:appointment).permit(:time, :reason, :account_id)
	end
end
