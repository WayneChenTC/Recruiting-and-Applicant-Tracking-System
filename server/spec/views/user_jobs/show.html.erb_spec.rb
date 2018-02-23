require 'rails_helper'

RSpec.describe "user_jobs/show", type: :view do
  before(:each) do
    @user_job = assign(:user_job, UserJob.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
