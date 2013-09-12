class Packet < ActiveRecord::Base
  attr_accessible :name, :description, :parent_id, :position
  has_many :children, :class_name => "Packet", :foreign_key => "parent_id"
  after_save :auto_position

  private

  def auto_position
    self.position = self.id
    self.save
  end
end
