class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_attached_file :cover

  validates_attachment :cover, :presence => true,
                       :content_type => { :content_type => "image/jpeg" }
  validates :title, :author_id, :year, :genre, presence: true
  validates :title, uniqueness: { scope: :year,
                                  message: "There can be only one issue a year",
                                  case_sensitive: false }

end