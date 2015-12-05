class Appointment < ActiveRecord::Base
	belongs_to :user
	belongs_to :account
	belongs_to :doctor, class_name: 'User'

	has_one :result

	after_save :create_result

	def create_result
		Result.create(appointment: self)
	end
end
