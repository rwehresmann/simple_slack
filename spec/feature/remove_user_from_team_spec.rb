require 'rails_helper'

describe "Remove user from team", type: :feature, js: true do
  it "removes the user from team" do
    owner = create(:user)
    invited = create(:user)
    team = create(:team, user: owner, users: [invited])

    login_as owner
    visit team_chat_path(team.slug)
    find("#channel_users").click
    find(".user_#{invited.id}_settings").click
    find("#remove_user_btn").click

    expect(page).to_not have_css(".open_user")
  end
end
