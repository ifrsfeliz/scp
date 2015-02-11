class CreateSituations < ActiveRecord::Migration
  def change
    create_table :situations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
