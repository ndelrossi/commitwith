require 'rails_helper'

feature "Visitor visits home page" do
  scenario "vistor visits home page and sees website info", js: true do
    visit root_path

    expect(page).to have_content("commitwith")
  end
end
