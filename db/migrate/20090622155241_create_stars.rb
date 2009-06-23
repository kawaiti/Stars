class CreateStars < ActiveRecord::Migration
  def self.up
    create_table :stars do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :activity_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stars
  end
end
