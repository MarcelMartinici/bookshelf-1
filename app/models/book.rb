class Book < ActiveRecord::Base

  validates :title, :author, :year, presence: true
  validates :title, uniqueness: { scope: :year,
                                  message: "There can be only one issue a year",
                                  case_sensitive: false }


end
