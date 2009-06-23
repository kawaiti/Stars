class Activity < ActiveRecord::Base
  belongs_to :member
  has_many :stars
end
