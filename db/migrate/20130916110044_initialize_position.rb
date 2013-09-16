class InitializePosition < ActiveRecord::Migration
  def up
    Packet.all.each do |p|
      p.update_column('position', p.id)
    end
  end

  def down
  end
end
