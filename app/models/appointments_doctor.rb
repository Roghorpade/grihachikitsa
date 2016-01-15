class AppointmentsDoctor < ActiveRecord::Base

	belongs_to :appointment
	belongs_to :doctor, class_name: "User", foreign_key: "doctor_id"

end
