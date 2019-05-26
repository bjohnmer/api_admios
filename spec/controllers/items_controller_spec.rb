require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:category) {
    create(:category)
  }

  let(:valid_attributes) {
    build(:item).attributes 
  }

  let(:invalid_attributes) {
    {
      name: nil,
      description: nil,
      aquisition_date: nil,
      category_id: nil
    }
  }

  describe "GET #index" do
    it "returns a success response" do
      category.items.create! valid_attributes
      get :index, params: { category_id: category.id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      item = category.items.create! valid_attributes
      get :show, params: { category_id: category.id, id: item.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, params: { category_id: category.id, item: valid_attributes }
        }.to change(category.items, :count).by(1)
      end

      it "renders a JSON response with the new item" do

        post :create, params: { category_id: category.id, item: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(category_item_url(category, Item.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new item" do

        post :create, params: { category_id: category.id, item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'New Item Name' }
      }

      it "updates the requested item" do
        item = category.items.create! valid_attributes
        put :update, params: { category_id: category.id, id: item.to_param, item: new_attributes }
        item.reload
	expect(item.name).to eq('New Item Name')
      end

      it "renders a JSON response with the item" do
        item = category.items.create! valid_attributes

        put :update, params: { category_id: category.id, id: item.to_param, item: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the item" do
        item = category.items.create! valid_attributes

        put :update, params: { category_id: category.id, id: item.to_param, item: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested item" do
      item = category.items.create! valid_attributes
      expect {
        delete :destroy, params: { category_id: category.id, id: item.to_param }
      }.to change(category.items, :count).by(-1)
    end
  end

end
