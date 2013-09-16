class Packet < ActiveRecord::Base
  attr_accessible :name, :description, :parent_id ,:position
  has_many :children, :class_name => "Packet", :foreign_key => "parent_id"
end
