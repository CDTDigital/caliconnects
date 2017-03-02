class Address < ApplicationRecord
  has_and_belongs_to_many :users

  def full_address
    "#{street}, #{city}, #{state}, #{zipcode}"
  end
end
