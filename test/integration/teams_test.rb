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
      assert_match @team.name, response.body
      assert_match @team2.name, response.body
  end
  
end
