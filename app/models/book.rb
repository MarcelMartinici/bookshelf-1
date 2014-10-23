class Book < ActiveRecord::Base

  belongs_to :author

  validates :title, :author_id, :year, presence: true
  validates :title, uniqueness: { scope: :year,
                                  message: "There can be only one issue a year",
                                  case_sensitive: false }


end