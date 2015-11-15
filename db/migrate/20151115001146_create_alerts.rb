class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :bus
      t.float :latitude
      t.float :longitude
      t.string :number

      t.timestamps null: false
    end
  end
end
