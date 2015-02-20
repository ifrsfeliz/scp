class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :nome
      t.references :professor, index: true
      t.date :data_inicio
      t.date :data_fim
      t.string :numero_suap
      t.string :nome_edital
      t.string :link_cnpq
      t.datetime :ultima_verificacao
      t.boolean :auxilio_aipct
      t.integer :valor_aipct
      t.references :research_line, index: true
      t.references :situation, index: true

      t.timestamps null: false
    end
    add_foreign_key :projects, :professors
    add_foreign_key :projects, :research_lines
    add_foreign_key :projects, :situations
  end
end
