class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :description, null: false
      t.date :aquisition_date, null: false

      t.timestamps
    end
  end
end
