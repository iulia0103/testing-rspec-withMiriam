require 'rails_helper'

describe "Navigating products" do
  it "allows navigation from the detail page to the listing page" do
      product = Product.create(name: "choco", description: "strawberries")

      visit product_url(product)
      click_link("Back")

      expect(current_path).to eq(products_path)
  end
end
