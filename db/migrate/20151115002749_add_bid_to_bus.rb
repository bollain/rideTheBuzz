class AddBidToBus < ActiveRecord::Migration
  def change
    add_column :buses, :bid, :integer
  end
end
