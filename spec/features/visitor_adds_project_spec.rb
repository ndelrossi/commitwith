require 'rails_helper'

feature "Visitor adds project" do

  before do
    visit root_path
  end

  scenario "vistor adds project with valid info", js: true do
    add_project("octopress", "imathis")
    click_button "modal-add-project"

    expect(page).to have_content("octopress")
  end

  scenario "vistor tries to add repo that does not exist", js: true do
    add_project("fakerepo", "fakename")

    expect(page).to have_css("div.alert-danger")
    expect(page).to have_content("Repo not found")
    expect(page).not_to have_content("fakerepo")
  end
  
  scenario "vistor tries to add project that already exists", js: true do
    add_project("commitwith", "ndelrossi")
    click_button "modal-add-project"
    add_project("commitwith", "ndelrossi")

    expect(page).to have_css("div.alert-danger")
    expect(page).to have_content("Repo already exists")
    expect(page).to have_content("commitwith", count: 1)
  end

  def add_project(name, author)
    click_button "Add Project"
    fill_in "repo-name", with: name
    fill_in "repo-owner", with: author
    click_button "find-repo"
  end
end
