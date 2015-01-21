require 'rails_helper'

feature "Visitor visits home page" do
  let!(:pro) { create(:project) }
  
  scenario "vistor visits home page and sees title", js: true do
    visit root_path

    expect(page).to have_content("Commitwith")
  end

  scenario "visitor sees project listed", js:true do
    visit root_path
    wait_for_ajax
    sleep 5

    expect(page).to have_content("ndelrossi")
  end
end
