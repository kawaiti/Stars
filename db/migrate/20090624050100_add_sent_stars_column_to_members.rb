class AddSentStarsColumnToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :sent_stars, :integer
  end

  def self.down
    remove_column :members, :sent_stars
  end
end
