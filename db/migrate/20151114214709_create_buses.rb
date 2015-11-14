class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.text :destination
      t.float :latitude
      t.float :longitude
      t.string :direction

      t.timestamps null: false
    end
  end
end
