require 'rails_helper'

RSpec.describe "UserJobs", type: :request do
  describe "GET /user_jobs" do
    it "works! (now write some real specs)" do
      get user_jobs_path
      expect(response).to have_http_status(200)
    end
  end
end
