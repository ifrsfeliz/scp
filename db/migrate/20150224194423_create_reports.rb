class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :data_entrega
      t.text :atividades_desenvolvidades
      t.text :resultados_obtidos
      t.text :dificuldades_encontradas
      t.text :proximas_etapas
      t.text :conclusoes
      t.text :referencias
      t.boolean :notificacao_antecipada
      t.boolean :notificacao_no_dia
      t.boolean :notificacao_atrasada
      t.references :project

      t.timestamps null: false
    end
  end
end
