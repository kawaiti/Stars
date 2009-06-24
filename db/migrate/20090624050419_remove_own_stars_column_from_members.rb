class RemoveOwnStarsColumnFromMembers < ActiveRecord::Migration
  def self.up
    remove_column :members, :own_stars
  end

  def self.down
    add_column :members, :own_stars, :integer
  end
end
