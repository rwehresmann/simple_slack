require 'rails_helper'

describe "Delete a channel", type: :feature, js: true do
  it "deletes the channel from team channels list" do
    user = create(:user)
    team = create(:team, user: user)
    channel = team.channels.first

    login_as user
    visit team_chat_path(team.slug)
    find("#team_channels").click
    find(".channel_#{channel.id}_settings").click
    find("#delete_channel").click

    expect(page).to have_css("#toast-container", visible: :all)
    expect(page).to_not have_css(".open_channel")
  end
end
