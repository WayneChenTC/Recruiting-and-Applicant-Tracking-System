require "rails_helper"

RSpec.describe UserJobsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_jobs").to route_to("user_jobs#index")
    end

    it "routes to #new" do
      expect(:get => "/user_jobs/new").to route_to("user_jobs#new")
    end

    it "routes to #show" do
      expect(:get => "/user_jobs/1").to route_to("user_jobs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_jobs/1/edit").to route_to("user_jobs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_jobs").to route_to("user_jobs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_jobs/1").to route_to("user_jobs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_jobs/1").to route_to("user_jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_jobs/1").to route_to("user_jobs#destroy", :id => "1")
    end

  end
end
