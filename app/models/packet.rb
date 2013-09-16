class Packet < ActiveRecord::Base
  attr_accessible :name, :description, :parent_id, :position
  has_many :children, :class_name => "Packet", :foreign_key => "parent_id"
  after_create :auto_position

  def auto_position
    self.position = self.id
  end
end
