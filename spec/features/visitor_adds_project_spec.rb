require 'rails_helper'

feature "Visitor adds project" do
  scenario "vistor adds project", js: true do
    visit root_path

    click_button "Add Project"
    fill_in "repo-name", with: "commitwith"
    fill_in "repo-owner", with: "ndelrossi"
    click_button "find-repo"
    click_button "modal-add-project"

    expect(page).to have_content("ndelrossi")
  end
end
