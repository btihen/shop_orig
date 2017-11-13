require 'rails_helper'

RSpec.describe "SaleItems", type: :request do
  describe "GET /sale_items" do
    it "works! (now write some real specs)" do
      get sale_items_path
      expect(response).to have_http_status(200)
    end
  end
end
