class Rating < ActiveRecord::Base
  class Rating < ActiveRecord::Base
    belongs_to :book
    belongs_to :user
    attr_accessor :stars
  end
end
