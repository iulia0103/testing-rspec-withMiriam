require 'rails_helper'

describe ProductsController do

  describe "GET #index" do
    it "assigns @products and renders the index template" do
      product = Product.create(name: "choco", description: "strawberries")

      get :index

      expect(assigns(:products)).to eq([product])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns @product and renders the show template" do
      product = Product.create(name: "choco", description: "strawberries")

      get :show, id: product.id

      expect(assigns(:product)).to eq(product)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product and renders the new template" do

      get :new

      expect(assigns(:product)).to be_a_new(Product)
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    let(:product) { Product.create(name: "choco", description: "strawberries")}

    before do
      get :edit, id: product.id
    end

    it "assigns a requested product as @product" do
      expect(assigns(:product)).to eq(product)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

    describe "POST #create" do
      context "with valid params" do
        let(:valid_params) { { product: {name: "choco", description: "strawberries"} } }

        it "assigns a newly created product as @product" do
          post :create, valid_params

          expect(assigns(:product)).to be_a(Product)
          expect(assigns(:product)).to be_persisted
        end
      end

      context "with invalid params" do
        let(:invalid_params) { { product: {name: "choco", description: nil} } }

        it "assigns a newly created but unsaved product as @product" do
          post :create, invalid_params

          expect(assigns(:product)).to be_a_new(Product)
        end
      end
    end

end
