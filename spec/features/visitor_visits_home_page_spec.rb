require 'rails_helper'

feature "Visitor visits home page" do
  let!(:proj) { create(:project, title: "rails", author: "rails") }
  
  scenario "vistor visits home page and sees title", js: true do
    visit root_path

    expect(page).to have_content("Commitwith")
  end

  scenario "visitor sees project listed", js:true do
    visit root_path

    expect(page).to have_content("rails")
  end
end
