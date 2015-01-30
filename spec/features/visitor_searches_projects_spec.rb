require 'rails_helper'

feature "visitor searches projects" do
  let!(:project1) { create(:project, title: "rails", author: "rails", category: "Web", skill: "Beginner") }
  let!(:project2) { create(:project, title: "glide", author: "bumptech", category: "Android", skill: "Advanced") }

  before do
    visit root_path
  end

  scenario "visitor searches for name of project", js: true do
    fill_in "input-search", with: "rails"

    expect(page).to have_content("rails")
    expect(page).not_to have_content("glide") 
  end

  scenario "visitor searches for category of project", js: true do
    fill_in "input-search", with: "android"

    expect(page).to have_content("glide")
    expect(page).not_to have_content("rails") 
  end

  scenario "visitor searches for skill of project", js: true do
    fill_in "input-search", with: "beginner"

    expect(page).to have_content("rails")
    expect(page).not_to have_content("glide") 
  end

  scenario "visitor searches for text in description of project", js: true do
    fill_in "input-search", with: "image loading"

    expect(page).to have_content("glide")
    expect(page).not_to have_content("rails") 
  end
end
