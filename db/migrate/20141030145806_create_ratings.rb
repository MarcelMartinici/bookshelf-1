class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
        t.integer :stars, :default => 0
        t.references :book
        t.references :user

      t.timestamps
    end
  end
end
