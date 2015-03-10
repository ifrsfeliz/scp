class AddColumnToStudentProjectRelationship < ActiveRecord::Migration
  def change
    add_column :member_students, :relatorio_entregue, :boolean
    add_column :member_students, :notificacao_antecipada, :boolean
    add_column :member_students, :notificacao_no_dia, :boolean
    add_column :member_students, :notificacao_atrasada, :boolean
    add_column :member_students, :ultima_data_notificacao_atrasada, :date
  end
end
