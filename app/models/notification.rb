class Notification < ActiveRecord::Base

    enum status: {pending: 0, accepted: 1, rejected: 2}

	## associations##
	belongs_to :appointment
	belongs_to :user
	belongs_to :doctor

end
