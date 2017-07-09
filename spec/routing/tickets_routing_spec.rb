require "rails_helper"

RSpec.describe TicketsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tickets").to route_to("tickets#index")
    end

    it "does not route to #show" do
      expect(:get => "/tickets/1").not_to be_routable
    end


    it "routes to #create" do
      expect(:post => "/tickets").to route_to("tickets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tickets/1").to route_to("tickets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tickets/1").to route_to("tickets#update", :id => "1")
    end

    it "does not route to #destroy" do
      expect(:delete => "/tickets/1").not_to be_routable
    end

  end
end
