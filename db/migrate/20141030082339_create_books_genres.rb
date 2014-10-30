class CreateBooksGenres < ActiveRecord::Migration
  def change
    create_table :books_genres, :id => false do |t|
    t.references :book, :genre

      t.timestamps
    end
  end
end