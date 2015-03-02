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

  describe "new" do
    subject { create(:inactive_project) }

    it { is_expected.to be_valid }
    it { is_expected.not_to be_active }
  end

  describe "#send_activation" do
    let(:project) { create(:project, email: "fake@fake.com") }

    before { project.send_activation }
  
    it "delivers email to project email" do  
      last_email_recipient = ActionMailer::Base.deliveries.last.to
      expect(last_email_recipient).to eq ([project.email])  
    end  
  end

  describe "#generate_token(column)" do
    let(:project) { create(:project) }

    it "generates a token" do
      project.auth_token = nil
      project.send(:generate_token, :auth_token)
      expect(project.auth_token).to be_present
    end
  end

  describe ".update_info" do
    let! (:project) { create(:project, size: 1, open_issues: 1, last_update: "2015-01-01T10:23:47Z") }

    it "connects to GitHub API and updates project info" do
      Project.update_info

      pending("This test needs to be fixed")
      fail

      #expect(project.size).to eq 1000
      #expect(project.open_issues).to eq 10
      #expect(project.last_update).to eq "2015-03-01T10:23:47Z"
    end
  end
end
