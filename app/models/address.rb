class Address < ApplicationRecord
  has_and_belongs_to_many :users
  validates_presence_of :street, :city, :state, :zipcode

  def full_address
    "#{street}, #{city}, #{state}, #{zipcode}"
  end
end
