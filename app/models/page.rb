class Page < ActiveRecord::Base
  
  scope :base, where(:parent_id => nil)
  scope :submenus, where(:submenu => true)
  
  acts_as_list
  acts_as_tree
  
  validates_presence_of :name, :stub
  validates_uniqueness_of :stub
end
