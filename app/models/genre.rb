class Genre < ActiveRecord::Base

  has_many :books_genres
  has_many :books, :through => :books_genres

  def self.create_from_name(name)
    split_name = name.split(",")
    split_name.map do |tag_name|
      Genre.find_or_create_by(tag: tag_name.to_s)
    end
  end
end