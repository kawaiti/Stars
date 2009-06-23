require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Star do
  before(:each) do
    @valid_attributes = {
      :sender_id => "1",
      :receiver_id => "1",
      :activity_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Star.create!(@valid_attributes)
  end
end
