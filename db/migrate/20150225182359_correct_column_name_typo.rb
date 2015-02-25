class CorrectColumnNameTypo < ActiveRecord::Migration
  def change
    rename_column :reports, :atividades_desenvolvidades, :atividades_desenvolvidas

  end
end
