require 'rails_helper'

describe "Delete a team", type: :feature, js: true do
  it "redirects to root page" do
    user = create(:user)
    team = create(:team, user: user)

    login_as user
    visit team_chat_path(team.slug)
    find(".team_settings").click
    find("#delete_team").click

    expect(page).to have_current_path(root_path)
  end
end
