class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_many :books_genres
  has_many :genres, :through => :books_genres
  ratyrate_rateable 'book_title'

  validates :title, :author_id, :year, presence: true
  validates :title, uniqueness: { scope: :year,
                                  message: "There can be only one issue a year",
                                  case_sensitive: false }

  mount_uploader :cover, CoverUploader

  ## Search
  scope :search, -> term {
    if term.present?
      where('title ILIKE :term OR description ILIKE :term OR authors.name ILIKE :term', term: "%#{term}%").
          eager_load(:author)
    end
  }

  def avg_rating

    average_rating = 0.0
    count = 0
    ratings.each do |rating|
      average_rating += rating.stars
      count += 1
    end

    if count != 0
      (average_rating / count)
    else
      count
    end
  end

  # def self.search(search)
  #   if search != nil
  #     where('title ILIKE ? OR description ILIKE ? OR authors.name ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  #     .joins('LEFT JOIN authors ON books.author_id = authors.id')
  #   else
  #     scoped
  #   end
 #  end
end

