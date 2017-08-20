require 'rails_helper'

describe "Create a channel", type: :feature, js: true do
  context "when channel name is invalid" do
    it "shows an error message" do
      channel_name = "Channel invalid name"

      create_channel_flow(channel_name)

      expect(page).to have_css("#toast-container", visible: :all)
    end
  end

  context "when channel name is valid" do
    it "creates a channel" do
      team_name = "Team"

      create_channel_flow(team_name)

      expect(page).to have_css(".open_channel", count: 2)
    end
  end
end

def create_channel_flow(channel_name)
  user = create(:user)
  team = create(:team, users: [user])

  login_as user
  visit team_chat_path(team.slug)
  find('#team_channels').click
  find('.add_channel').click
  fill_in "channel_slug", with: channel_name
  click_on  "create_channel_btn"
end
