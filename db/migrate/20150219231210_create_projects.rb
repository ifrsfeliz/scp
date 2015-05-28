class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :nome
      t.references :professor
      t.date :data_inicio
      t.date :data_fim
      t.string :numero_suap
      t.string :nome_edital
      t.string :link_cnpq
      t.datetime :ultima_verificacao
      t.boolean :auxilio_aipct
      t.integer :valor_aipct
      t.references :research_line
      t.references :situation

      t.timestamps null: false
    end
  end
end
