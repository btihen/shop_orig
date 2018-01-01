require 'rails_helper'

RSpec.describe "SupplierPackages", type: :request do
  describe "GET /supplier_packages" do
    it "works! (now write some real specs)" do
      get supplier_packages_path
      expect(response).to have_http_status(200)
    end
  end
end
