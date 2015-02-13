class CreateResearchLines < ActiveRecord::Migration
  def change
    create_table :research_lines do |t|
      t.string :nome
      t.references :research_group, index: true

      t.timestamps null: false
    end
    add_foreign_key :research_lines, :research_groups
  end
end
