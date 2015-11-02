class Image < ActiveRecord::Base
  attr_accessor :copy_of
  has_attached_file :image,  :styles => { :original => "15x15>" }, :default_url => 'no_image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  before_save :generate_price

  def generate_price
    ::PriseService.generate_prise(self)
  end
end