class Building < ActiveRecord::Base
  belongs_to :owner,
    inverse_of: :buildings

  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
end
