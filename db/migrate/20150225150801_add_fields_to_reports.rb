class AddFieldsToReports < ActiveRecord::Migration
  def change
    add_column :reports, :periodo_desenvolvimento_inicio, :date
    add_column :reports, :periodo_desenvolvimento_fim, :date
    remove_column :reports, :data_entrega
  end
end
