class AddColumnToReportTable < ActiveRecord::Migration
  def change
    add_column :reports, :ultima_data_notificacao_atrasada, :date

  end
end
