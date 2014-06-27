class AddRememberTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string

    # We expect to retrieve users by remember token, so add index
    add_index :users, :remember_token
  end
end
