require 'rails_helper'

describe Product do
  describe "validations" do
    it "requires a name" do
      product = Product.new(name: "")
      product.valid?
      expect(product.errors).to have_key(:name)
    end

    it "requires a description" do
      product = Product.new(description: "")
      product.valid?
      expect(product.errors).to have_key(:description)
    end

    it "requires a price" do
      product = Product.new(price: nil)
      product.valid?
      expect(product.errors).not_to have_key(:price)
    end
  end

  describe "bargain?" do
    it "is true if the price is less than 5" do
      product = Product.new(price: 4)
      expect(product.bargain?).to eq(true)
    end

    it "is false if the price is more than 5" do
      product = Product.new(price: 6)
      expect(product.bargain?).to eq(false)
    end
  end

end
