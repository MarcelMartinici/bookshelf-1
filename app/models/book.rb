class Book < ActiveRecord::Base

  belongs_to :author
  belongs_to :user
  has_many :books_genres
  has_many :genres, :through => :books_genres

  validates :title, :author_id, :year, presence: true
  validates :title, uniqueness: { scope: :year,
                                  message: "There can be only one issue a year",
                                  case_sensitive: false }

  ## Images
  has_attached_file :cover, :styles => { :medium => "300x300>", :small => "20x20>" }, :default_url => "/images/original/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  ## Search
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

