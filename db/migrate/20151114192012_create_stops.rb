class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :stopNumber
      t.text :onStreet
      t.text :atStreet
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
