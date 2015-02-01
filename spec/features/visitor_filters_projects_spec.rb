require 'rails_helper'

feature "visitor filters projects" do
  let!(:project1) { create(:rails) }
  let!(:project2) { create(:glide) }
  
  
  before do
    visit root_path
    click_button "Filter"
  end

  scenario "visitor filters projects by language", js: true do
    click_link "Ruby"

    expect(page).to have_content("rails")
    expect(page).not_to have_content("glide") 
  end

  scenario "visitor filters projects by category", js: true do
    click_link "Android"

    expect(page).to have_content("glide")
    expect(page).not_to have_content("rails") 
  end

  scenario "visitor filters projects by skill level", js: true do
    click_link "Advanced"

    expect(page).to have_content("glide")
    expect(page).not_to have_content("rails") 
  end

  scenario "visitor filters list and then resets the list", js: true do
    click_link "Android"
    expect(page).to have_content("glide")
    expect(page).not_to have_content("rails")

    click_button "Reset"

    expect(page).to have_content("glide")
    expect(page).to have_content("rails")
  end

end
