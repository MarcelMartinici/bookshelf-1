class Author < ActiveRecord::Base
  has_many :books

  def self.create_from_name(name)
    Author.find_or_create_by(name: name)
  end

end
