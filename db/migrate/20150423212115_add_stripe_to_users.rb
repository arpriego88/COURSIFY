class AddStripeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscribed, :boolean, null: false, default: false
    add_column :users, :stripeid, :string
  end
end
