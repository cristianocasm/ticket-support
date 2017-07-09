require "rails_helper"

RSpec.describe MessagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tickets/1/messages").to route_to("messages#index", :ticket_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tickets/1/messages").to route_to("messages#create", :ticket_id => "1")
    end

    it "does not route to #index" do
      expect(:get => "/messages").not_to be_routable
    end


    it "does not route to #show" do
      expect(:get => "/messages/1").not_to be_routable
    end


    it "does not route to #create" do
      expect(:post => "/messages").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(:put => "/messages/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/messages/1").not_to be_routable
    end

    it "does not route to #destroy" do
      expect(:delete => "/messages/1").not_to be_routable
    end

  end
end
