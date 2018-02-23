require 'rails_helper'

RSpec.describe "user_jobs/index", type: :view do
  before(:each) do
    assign(:user_jobs, [
      UserJob.create!(),
      UserJob.create!()
    ])
  end

  it "renders a list of user_jobs" do
    render
  end
end
