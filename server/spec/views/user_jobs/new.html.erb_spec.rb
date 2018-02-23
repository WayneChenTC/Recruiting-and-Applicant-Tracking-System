require 'rails_helper'

RSpec.describe "user_jobs/new", type: :view do
  before(:each) do
    assign(:user_job, UserJob.new())
  end

  it "renders new user_job form" do
    render

    assert_select "form[action=?][method=?]", user_jobs_path, "post" do
    end
  end
end
