class DropUserRoles < ActiveRecord::Migration
  def change
    drop_table :users_roles
  end
end
