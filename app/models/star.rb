class Star < ActiveRecord::Base
  belongs_to :sender,
             :class_name => "Member",
             :foreign_key => "sender_id",
             :counter_cache => "sent_stars"
  belongs_to :receiver,
             :class_name => "Member", 
             :foreign_key => "receiver_id",
             :counter_cache => "received_stars"
  belongs_to :activity
end
