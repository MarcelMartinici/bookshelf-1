class Rating < ActiveRecord::Base

  validates_presence_of :stars
    belongs_to :book
    belongs_to :user
end
