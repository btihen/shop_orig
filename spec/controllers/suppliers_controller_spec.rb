require 'rails_helper'

RSpec.describe SuppliersController, type: :controller do

  let(:valid_attributes)   { FactoryBot.build(:supplier).attributes }
  let(:invalid_attributes) { FactoryBot.build(:invalid_supplier).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SuppliersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      supplier = Supplier.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      supplier = Supplier.create! valid_attributes
      get :show, params: {id: supplier.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      supplier = Supplier.create! valid_attributes
      get :edit, params: {id: supplier.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Supplier" do
        expect {
          post :create, params: {supplier: valid_attributes}, session: valid_session
        }.to change(Supplier, :count).by(1)
      end

      it "redirects to the created supplier" do
        post :create, params: {supplier: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Supplier.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {supplier: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {supplier_notes: "Lots of Malas"} }

      it "updates the requested supplier" do
        supplier = Supplier.create! valid_attributes
        put :update, params: {id: supplier.to_param, supplier: new_attributes}, session: valid_session
        supplier.reload
        expect( supplier.supplier_notes ).to eq( "Lots of Malas" )
      end

      it "redirects to the supplier" do
        supplier = Supplier.create! valid_attributes
        put :update, params: {id: supplier.to_param, supplier: valid_attributes}, session: valid_session
        expect(response).to redirect_to(supplier)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        supplier = Supplier.create! valid_attributes
        put :update, params: {id: supplier.to_param, supplier: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested supplier" do
      supplier = Supplier.create! valid_attributes
      expect {
        delete :destroy, params: {id: supplier.to_param}, session: valid_session
      }.to change(Supplier, :count).by(-1)
    end

    it "redirects to the suppliers list" do
      supplier = Supplier.create! valid_attributes
      delete :destroy, params: {id: supplier.to_param}, session: valid_session
      expect(response).to redirect_to(suppliers_url)
    end
  end

end
