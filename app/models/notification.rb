class Notification < ActiveRecord::Base

	## associations##
	belongs_to :appointment
	belongs_to :user
	belongs_to :doctor

end
