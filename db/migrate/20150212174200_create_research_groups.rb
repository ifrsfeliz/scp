class CreateResearchGroups < ActiveRecord::Migration
  def change
    create_table :research_groups do |t|
      t.string :nome
      t.references :professor
      t.date :ultima_atualizacao

      t.timestamps null: false
    end
  end
end
