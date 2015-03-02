require 'rails_helper'

describe Project do
  
  describe "scopes" do
    describe "active" do
      it "returns all projects with active set to true" do
        create(:project, name: "Foo", email: "fake@fake.com", active: true)
        create(:project, name: "FooBar", email: "fake@fake.com", active: false)
        create(:project, name: "FooBaz", email: "fake@fake.com", active: true)

        expect(Project.active.pluck(:name)).to eq ["Foo", "FooBaz"]
      end
    end
  end
end
