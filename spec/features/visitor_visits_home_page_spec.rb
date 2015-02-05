require 'rails_helper'

feature "Visitor visits home page" do
  scenario "vistor visits home page and sees title", js: true do
    visit root_path

    expect(page).to have_content("Commitwith")
  end

  scenario "visitor sees project listed", js:true do
    create(:project, name: "rails", author: "rails")

    visit root_path

    expect(page).to have_content("rails")
  end
end
