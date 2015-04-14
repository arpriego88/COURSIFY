class ChangeNullToFalse < ActiveRecord::Migration
  def change
    change_column :lessons, :complete, :boolean, null: false, default: false
  end
end
