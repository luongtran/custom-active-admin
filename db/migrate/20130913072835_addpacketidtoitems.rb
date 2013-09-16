class Addpacketidtoitems < ActiveRecord::Migration
  def up
    add_column :items, :packet_id, :integer
  end

  def down
  end
end
