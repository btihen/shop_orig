require 'rails_helper'

RSpec.describe "OrderLines", type: :request do
  describe "GET /order_lines" do
    it "works! (now write some real specs)" do
      get order_lines_path
      expect(response).to have_http_status(200)
    end
  end
end
