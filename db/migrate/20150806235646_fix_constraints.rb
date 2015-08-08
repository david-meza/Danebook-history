class FixConstraints < ActiveRecord::Migration
  def change

    # Add uniqueness constraint to user_id in profiles table
    change_column :profiles, :user_id, :integer, null: false, unique: true

    # Likeable ID and type should not be null
    change_column :likes, :likeable_id, :integer, null: false
    change_column :likes, :likeable_type, :string, null: false

    # Friending Timestamps can't be null
    change_column :friendings, :created_at, :datetime, null: false
    change_column :friendings, :updated_at, :datetime, null: false

    # Comment attributes can't be null
    change_column :comments, :author_id, :integer, null: false
    change_column :comments, :body, :string, null: false
    change_column :comments, :commentable_id, :integer, null: false
    change_column :comments, :commentable_type, :string, null: false

    # User email must be unique
    change_column :users, :email, :string, null: false, unique: true

  end
end