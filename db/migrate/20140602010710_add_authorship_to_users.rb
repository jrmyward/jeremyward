class AddAuthorshipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gplus, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :avatar, :string
  end
end
