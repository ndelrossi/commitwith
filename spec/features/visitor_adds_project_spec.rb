require 'rails_helper'

feature "Visitor adds project" do

  before do
    visit root_path
  end

  scenario "vistor adds project with valid info", js: true do
    click_button "Add Project"
    fill_in "repo-name", with: "octopress"
    fill_in "repo-owner", with: "imathis"
    click_button "find-repo"
    click_button "modal-add-project"

    expect(page).to have_content("octopress")
  end

  scenario "vistor tries to add repo that does not exist", js: true do
    click_button "Add Project"
    fill_in "repo-name", with: "fakerepo"
    fill_in "repo-owner", with: "fakename"
    click_button "find-repo"

    expect(page).to have_css("div.alert-danger")
    expect(page).to have_content("Repo not found")
    expect(page).not_to have_content("fakerepo")
  end
end
