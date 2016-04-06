class CreateResearchGroups < ActiveRecord::Migration
  def change
    create_table :research_groups do |t|
      t.string :nome
      t.integer :professor_id
      t.date :ultima_atualizacao

      t.timestamps null: false
    end
  end
end
