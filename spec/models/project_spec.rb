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

  describe "#send_activation" do
    let(:project) { create(:project, email: "fake@fake.com") }

    before { project.send_activation }
  
    it "delivers email to project email" do  
      last_email_recipient = ActionMailer::Base.deliveries.last.to
      expect(last_email_recipient).to eq ([project.email])  
    end  
  end
end
