require 'rails_helper'

RSpec.describe "user_jobs/edit", type: :view do
  before(:each) do
    @user_job = assign(:user_job, UserJob.create!())
  end

  it "renders the edit user_job form" do
    render

    assert_select "form[action=?][method=?]", user_job_path(@user_job), "post" do
    end
  end
end
