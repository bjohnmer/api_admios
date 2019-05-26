require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /category/:category_id/items" do
    it "works! (now write some real specs)" do
      category = create(:category)
      get category_items_path(category)
      expect(response).to have_http_status(200)
    end
  end
end
