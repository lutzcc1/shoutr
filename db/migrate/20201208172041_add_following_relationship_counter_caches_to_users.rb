class AddFollowingRelationshipCounterCachesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :followed_users_count, :int, default: 0, null: false
    add_column :users, :followers_count, :int, default: 0, null: false
  end
end