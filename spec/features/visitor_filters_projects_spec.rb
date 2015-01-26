require 'rails_helper'

feature "visitor filters projects" do
  let!(:project1) { create(:project, title: "rails", author: "rails", category: "Web") }
  let!(:project2) { create(:project, title: "glide", author: "bumptech", category: "Android") }
  
  
  before do
    visit root_path
  end

  scenario "visitor filters projects by language", js: true do
    click_button "Filter"
    click_link "Ruby"

    expect(page).to have_content("rails")
    expect(page).not_to have_content("glide") 
  end

  scenario "visitor filters projects by category", js: true do
    click_button "Filter"
    click_link "Android"

    expect(page).to have_content("glide")
    expect(page).not_to have_content("rails") 
  end

  scenario "visitor filters list and then resets the list", js: true do
    click_button "Filter"
    click_link "Android"
    expect(page).to have_content("glide")
    expect(page).not_to have_content("rails")

    click_button "Reset"

    expect(page).to have_content("glide")
    expect(page).to have_content("rails")
  end

end
