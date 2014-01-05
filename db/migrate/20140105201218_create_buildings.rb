class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.text :description

      t.timestamps
    end
  end
end
