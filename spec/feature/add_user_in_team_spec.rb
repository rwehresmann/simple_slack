require 'rails_helper'

describe "Add user in team", type: :feature, js: true do
  context "when user email isn't registered" do
    it "shows an error message" do
      unregistered_invite_email = "lena@mail.com"

      invite_user_flow(unregistered_invite_email)

      expect(page).to have_css("#toast-container", visible: :all)
      expect(page).to_not have_css(".open_user")
    end
  end

  context "when user email is registered" do
    it "creates a channel" do
      user = create(:user)

      invite_user_flow(user.email)

      expect(page).to have_css(".open_user")
    end
  end
end

def invite_user_flow(invite_email)
  user = create(:user)
  team = create(:team, user: user)

  login_as user
  visit team_chat_path(team.slug)
  find('#channel_users').click
  find('.add_user').click
  fill_in "team_user_email", with: invite_email
  click_on  "add_user_btn"
end
