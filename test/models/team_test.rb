require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  
  def setup
    @team = Team.new(name: "Liverpool", description: "European Royalty")
  end 
  
  test "team should be valid" do
    assert @team.valid?
  end
  
  test "name should be present" do
    @team.name = " "
    assert_not @team.valid?
  end
  
  test "description should be present" do
    @team.description = " "
    assert_not @team.valid?
  end
  
  test "description shouldn't be less than 5 characters" do
    @team.description = "a" * 3
    assert_not @team.valid?
  end
  
  test "description shouldn't be more tha n 500 character" do
    @team.description = "a" * 501
    assert_not @team.valid?
  end
  
end