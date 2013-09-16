class Addparentid < ActiveRecord::Migration
  def up
    add_column :packets, :parent_id, :integer
  end

  def down
  end
end
