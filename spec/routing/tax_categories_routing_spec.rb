require "rails_helper"

RSpec.describe TaxCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tax_categories").to route_to("tax_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/tax_categories/new").to route_to("tax_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/tax_categories/1").to route_to("tax_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tax_categories/1/edit").to route_to("tax_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tax_categories").to route_to("tax_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tax_categories/1").to route_to("tax_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tax_categories/1").to route_to("tax_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tax_categories/1").to route_to("tax_categories#destroy", :id => "1")
    end

  end
end
