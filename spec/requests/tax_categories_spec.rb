require 'rails_helper'

RSpec.describe "TaxCategories", type: :request do
  describe "GET /tax_categories" do
    it "works! (now write some real specs)" do
      get tax_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
