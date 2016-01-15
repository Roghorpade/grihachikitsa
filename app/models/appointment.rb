class Appointment < ActiveRecord::Base
	belongs_to :user
	belongs_to :account
	belongs_to :doctor, class_name: 'User', foreign_key: 'doctor_id'
	has_many :notifications
	has_many :appointments_doctors
	has_many :doctors, through: :appointments_doctors, class_name: "User", foreign_key: 'doctor_id'

	has_one :result

	after_save :create_result

	def create_result
		Result.create(appointment: self)
	end

end
