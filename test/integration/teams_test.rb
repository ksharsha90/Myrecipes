require 'test_helper'

class TeamsTest < ActionDispatch::IntegrationTest
  
  def setup
    @rowdie = Rowdie.create!(rowdyname: "harsha", email: "harsha@example.com")
    @team = Team.create(name: "Real Madrid", description: "La Decima achieved", rowdie: @rowdie)
    @team2 = @rowdie.teams.build(name: "Barca", description: "Cheaters in football")
    @team2.save
  end
 
  test "should get teams index" do 
    get teams_url
    assert_response :success
  end
  
  test "should get teams listing" do
      get teams_path
      assert_template 'teams/index'
      assert_select "a[href=?]", team_path(@team), text: @team.name
      assert_select "a[href=?]", team_path(@team2), text: @team2.name
  end
  
  test "should get teams show" do
    get team_path(@team)
    assert_template 'teams/show'
    assert_match @team.name, response.body
    assert_match @team.description, response.body
    assert_match @rowdie.rowdyname, response.body
  end
  
  test "create new valid team" do
    get new_team_path
  end
  
  test "reject invalid team submissions" do
    get new_team_path
  end
  
end
