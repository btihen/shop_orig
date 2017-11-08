require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :product_name => "MyString",
      :description => "MyText",
      # :order_price => "",
      :order_price => Money.new(10000, 'CHF'),
      :order_currency => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[product_name]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[order_price]"

      assert_select "input[name=?]", "product[order_currency]"
    end
  end
end
