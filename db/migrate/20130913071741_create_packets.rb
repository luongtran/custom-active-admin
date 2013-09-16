class CreatePackets < ActiveRecord::Migration
  def change
    create_table :packets do |t|
      t.string :name

      t.timestamps
    end
  end
end
