class AddSubmenuToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :submenu, :boolean
  end

  def self.down
    remove_column :pages, :submenu
  end
end
