class AddPositiontoPacket < ActiveRecord::Migration
  def up
    add_column :packets, :position, :integer
  end

  def down
  end
end
