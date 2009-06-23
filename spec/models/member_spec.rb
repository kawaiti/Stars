require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Member do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :role_id => "1",
      :own_stars => "1",
      :received_stars => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Member.create!(@valid_attributes)
  end
end
