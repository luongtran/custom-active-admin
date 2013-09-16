class AddDescriptsToPacket < ActiveRecord::Migration
  def change
    add_column :packets, :description, :string
  end
end
