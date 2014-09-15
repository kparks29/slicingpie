class Grunt < ActiveRecord::Base
  
  belongs_to :company
  belongs_to :user
  has_many :hours
  has_many :investments
  has_many :assets
  has_many :facilities
  has_many :ips
  has_many :commissions

  
end
