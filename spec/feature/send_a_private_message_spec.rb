require 'rails_helper'

describe "Send a private message", type: :feature, js: true do
  it "shows messages sended in channel" do
    users = create_pair(:user)
    team = create(:team, users: users)
    message_text = "Test message"

    login_as users[0]
    visit team_chat_path(team.slug)
    find("#channel_users").click
    find("#user_#{users[1].id}").click
    fill_in "new_message", with: message_text
    find("#new_message").native.send_keys :enter

    expect(page).to have_selector(".message")
    expect(page).to have_content(message_text)
  end
end
