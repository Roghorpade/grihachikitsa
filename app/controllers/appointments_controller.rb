class AppointmentsController < ApplicationController
	def index
		@appointments = Appointment.where(user: current_user)
	end

	def new
		@appointment = Appointment.new
		@users = User.all
@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  marker.lat user.latitude
  marker.lng user.longitude

end

#@hash = @hash.map do |opt|
	#if opt[:lat] == current_user.latitude  && opt[:lng ]== current_user.longitude
		#opt
	#else
		#opt.merge!({infowindow: "hello!", picture: {url: "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png", height: 32, width: 32}})
	#end
#end

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
