require 'rails_helper'

describe "Send a message to a channel", type: :feature, js: true do
  it "shows messages sended in channel" do
    users = create_pair(:user)
    team = create(:team, users: users)
    message_text = "Test message"

    users.each do |user|
      login_as user
      visit team_chat_path(team.slug)
      fill_in "new_message", with: message_text
      find("#new_message").native.send_keys :enter
      page.save_screenshot("IMG.png")
      logout user
    end

    expect(page).to have_selector(".message", count: 2)
    expect(page).to have_content(message_text)
  end
end
