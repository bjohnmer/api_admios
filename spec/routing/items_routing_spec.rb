require "rails_helper"

RSpec.describe ItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: category_items_path(1)).to route_to(controller: 'items', action: 'index', category_id: '1')
    end

    it "routes to #show" do
      expect(get: category_item_path(1,1)).to route_to(controller: 'items', action: 'show', category_id: '1', id: '1')
    end

    it "routes to #create" do
      expect(post: category_items_path(1)).to route_to(controller: 'items', action: 'create', category_id: '1')
    end

    it "routes to #update via PUT" do
      expect(put: category_item_path(1,1)).to route_to(controller: 'items', action: 'update', category_id: '1', id: '1')
    end

    it "routes to #update via PATCH" do
      expect(patch: category_item_path(1,1)).to route_to(controller: 'items', action: 'update', category_id: '1', id: '1')
    end

    it "routes to #destroy" do
      expect(delete: category_item_path(1,1)).to route_to(controller: 'items', action: 'destroy', category_id: '1', id: '1')
    end
  end
end
