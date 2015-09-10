class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  enum gender: {male: 0, female: 1}

  has_many :appointments
  has_many :accounts

  def name
  	"#{first_name} #{last_name}"
  end

  def age
  	((Date.current - date_of_birth)/365).to_i if date_of_birth
  end
end
