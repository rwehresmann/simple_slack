require 'rails_helper'

describe "Create a team", type: :feature, js: true do
  context "when team name is invalid" do
    it "shows an error message" do
      team_name = "Team invalid name"

      create_team_flow(team_name)

      expect(page).to have_css("#toast-container", visible: :all)
      expect(page).to have_current_path(root_path)
    end
  end

  context "when team name is valid" do
    it "creates a team" do
      team_name = "Team"

      create_team_flow(team_name)

      expect(page).to have_current_path team_chat_path(team_name)
    end
  end
end

def create_team_flow(team_name)
  user = create(:user)

  login_as user
  visit root_path
  find('#add_team').click
  fill_in "team_slug", with: team_name
  click_on  "create_team_btn"
end
