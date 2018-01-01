require "rails_helper"

RSpec.describe SupplierPackagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/supplier_packages").to route_to("supplier_packages#index")
    end

    it "routes to #new" do
      expect(:get => "/supplier_packages/new").to route_to("supplier_packages#new")
    end

    it "routes to #show" do
      expect(:get => "/supplier_packages/1").to route_to("supplier_packages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/supplier_packages/1/edit").to route_to("supplier_packages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/supplier_packages").to route_to("supplier_packages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/supplier_packages/1").to route_to("supplier_packages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/supplier_packages/1").to route_to("supplier_packages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/supplier_packages/1").to route_to("supplier_packages#destroy", :id => "1")
    end

  end
end
