class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :commentable, polymorphic: true
      t.string :name
      t.string :email
      t.text :body
      t.string :site_url
      t.string :user_ip
      t.string :user_agent
      t.string :referrer
      t.boolean :approved, :default => false, :null => false
      t.string :ancestry
      t.timestamps
    end
    add_index :comments, :commentable_id
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, :ancestry
  end
end
