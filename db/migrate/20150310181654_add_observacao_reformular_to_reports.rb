class AddObservacaoReformularToReports < ActiveRecord::Migration
  def change
    add_column :reports, :observacao_reformular, :text
  end
end
