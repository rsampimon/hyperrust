class AddActiveToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :active, :boolean, :default => true
  end

  def self.down
    remove_column :pages, :active
  end
end
