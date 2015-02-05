require 'rails_helper'

feature "visitor sorts projects" do
  let!(:project1) { create(:foo, open_issues: 1, size: 1000) }
  let!(:project2) { create(:rails, open_issues: 100, size: 400) }
  let!(:project3) { create(:glide, open_issues: 50, size: 700) }

  before do
    visit root_path
  end

  scenario "visitor sorts projects by number of open issues", js: true do
    click_link "sort-open_issues"

    expect(page.text).to match(/foo.*glide.*rails/)

    click_link "sort-open_issues"

    expect(page.text).to match(/rails.*glide.*foo/)
  end

  scenario "visitor sorts projects by size", js: true do
    click_link "sort-size"

    expect(page.text).to match(/rails.*glide.*foo/)

    click_link "sort-size"

    expect(page.text).to match(/foo.*glide.*rails/)
  end
end
