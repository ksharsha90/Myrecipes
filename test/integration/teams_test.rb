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
    assert_template 'teams/new'
    name_of_team = "Barca"
    description_of_team = "Worst and Cheaters team, Tiki-taka, I hate them"
    assert_difference 'Team.count', 1 do
      post teams_path, params: { team: { name: name_of_team, description: description_of_team } }
    end
    follow_redirect!
    assert_match name_of_team.capitalize, response.body
    assert_match description_of_team, response.body
  end
  
  test "reject invalid team submissions" do
    get new_team_path
    assert_template 'teams/new'
    assert_no_difference 'Team.count' do
      post teams_path, params: { team: {name: " ", description: " " } }
    end
    assert_template 'teams/new'
    assert_select 'h2.card-title'
    assert_select 'div.card-body'
  end
  
end
