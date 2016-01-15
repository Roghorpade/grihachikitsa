class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  enum gender: {male: 0, female: 1}

  has_many :appointments_doctors
  has_many :appointments, through: :appointments_doctors, foreign_key: 'doctor_id'

  has_many :accounts

  accepts_nested_attributes_for :accounts

  geocoded_by :address
  after_validation :geocode

  def name
  	"#{first_name} #{last_name}"
  end

  def age
  	((Date.current - date_of_birth)/365).to_i if date_of_birth
  end

  def self.doctors
    User.first(5)
  end
end
