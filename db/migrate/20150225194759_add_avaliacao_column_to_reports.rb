class AddAvaliacaoColumnToReports < ActiveRecord::Migration
  def change
    add_column :reports, :avaliacao, :string
  end
end
