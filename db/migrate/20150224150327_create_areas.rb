class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
