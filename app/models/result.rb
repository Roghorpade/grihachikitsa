class Result < ActiveRecord::Base
  has_attached_file :document, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :document, content_type: /\Aimage\/.*\Z/

  belongs_to :appointment
end
