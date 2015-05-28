class CreateResearchLines < ActiveRecord::Migration
  def change
    create_table :research_lines do |t|
      t.string :nome
      t.references :research_group

      t.timestamps null: false
    end
  end
end
