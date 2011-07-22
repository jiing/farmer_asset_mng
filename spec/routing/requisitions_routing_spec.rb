require "spec_helper"

describe RequisitionsController do
  describe "routing" do

    it "routes to #index" do
      get("/requisitions").should route_to("requisitions#index")
    end

    it "routes to #new" do
      get("/requisitions/new").should route_to("requisitions#new")
    end

    it "routes to #show" do
      get("/requisitions/1").should route_to("requisitions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/requisitions/1/edit").should route_to("requisitions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/requisitions").should route_to("requisitions#create")
    end

    it "routes to #update" do
      put("/requisitions/1").should route_to("requisitions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/requisitions/1").should route_to("requisitions#destroy", :id => "1")
    end

  end
end
