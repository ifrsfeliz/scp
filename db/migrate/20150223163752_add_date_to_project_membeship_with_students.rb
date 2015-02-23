class AddDateToProjectMembeshipWithStudents < ActiveRecord::Migration
  def change
    add_column :member_students, :data_inicio, :date
    add_column :member_students, :data_fim, :date
  end
end
