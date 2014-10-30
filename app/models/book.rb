class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_attached_file :cover
  has_many :books_genres
  has_many :genres, :through => :books_genres

  validates_attachment :cover, :presence => true,
                       :content_type => { :content_type => "image/jpeg" }
  validates :title, :author_id, :year, presence: true
  validates :title, uniqueness: { scope: :year,
                                  message: "There can be only one issue a year",
                                  case_sensitive: false }


  scope :search, -> term {
    if term.present?
      where('title ILIKE :term OR description ILIKE :term OR authors.name ILIKE :term', term: "%#{term}%").
          eager_load(:author)
    end
  }

  # def self.search(search)
  #   if search != nil
  #     where('title ILIKE ? OR description ILIKE ? OR authors.name ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  #     .joins('LEFT JOIN authors ON books.author_id = authors.id')
  #   else
  #     scoped
  #   end
 #  end
end

