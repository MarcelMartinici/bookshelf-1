class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_id
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
