require 'rails_helper'

# These tests connect to GitHub API and will start failing when GitHub's API limit has been reached.
# Todo: Find a way to stub out the API calls from backbone

feature "Visitor adds project" do

  before do
    visit root_path
  end

  scenario "vistor adds project with valid info", js: true do
    add_project("octopress", "imathis")
    click_button "modal-add-project"
    wait_for_ajax
    visit root_path

    expect(page).to have_content("octopress")
  end

  scenario "vistor tries to add repo that does not exist", js: true do
    add_project("fakerepo", "fakename")

    expect(page).to have_css("div.alert-danger")
    expect(page).to have_content("Could not find repo with that name and owner")
    expect(page).not_to have_content("fakerepo")
  end
  
  scenario "vistor tries to add project that already exists", js: true do
    add_project("node", "joyent")
    click_button "modal-add-project"
    wait_for_ajax
    visit root_path
    add_project("node", "joyent")

    expect(page).to have_css("div.alert-danger")
    expect(page).to have_content("Project already exists")
    expect(page).to have_content("node", count: 1)
  end

  scenario "vistor finds repo and sees primary language pre-loaded", js: true do
    add_project("commitwith", "ndelrossi")

    expect(page).to have_content("Ruby")
  end
  

  def add_project(name, author)
    click_button "Add Project"
    fill_in "repo-name", with: name
    fill_in "repo-owner", with: author
    click_button "find-repo"
  end
end
