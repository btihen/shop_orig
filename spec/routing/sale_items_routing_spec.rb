require "rails_helper"

RSpec.describe SaleItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sale_items").to route_to("sale_items#index")
    end

    it "routes to #new" do
      expect(:get => "/sale_items/new").to route_to("sale_items#new")
    end

    it "routes to #show" do
      expect(:get => "/sale_items/1").to route_to("sale_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sale_items/1/edit").to route_to("sale_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sale_items").to route_to("sale_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sale_items/1").to route_to("sale_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sale_items/1").to route_to("sale_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sale_items/1").to route_to("sale_items#destroy", :id => "1")
    end

  end
end
