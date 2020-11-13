class CreatePlantLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_labels do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
