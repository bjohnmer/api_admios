class Item < ApplicationRecord
  belongs_to :category

  validates_presence_of :name, :description, :category, :aquisition_date
end
