class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.integer :role_id
      t.integer :own_stars
      t.integer :received_stars

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
