class CreateResearchGroups < ActiveRecord::Migration
  def change
    create_table :research_groups do |t|
      t.string :nome
      t.references :professor, index: true
      t.date :ultima_atualizacao

      t.timestamps null: false
    end
    add_foreign_key :research_groups, :professors
  end
end
