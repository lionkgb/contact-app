class Contact < ApplicationRecord
  has_many :contact_groups
  has_many :groups, through: :contact_groups
  
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end 
  def full_name
    "#{first_name} #{last_name}"
  end
  def prefix
    "+ 81#{phone_number}"
  end
  # def geocode
  #   geocoded_by :street_address   # can also be an IP address
  #   after_validation :geocode          # auto-fetch coordinates
  # end
  # def reverse_geocode
  #   reverse_geocoded_by :latitude, :longitude
  #   after_validation :reverse_geocode  # auto-fetch address
  # def coordinates 
  #   "#{longitude}#{latitude}"
  # end
end
