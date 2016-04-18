class AddEnviadoEmParaReports < ActiveRecord::Migration
  def change
    add_column :reports, :enviado_pelo_pesquisador_em, :datetime
  end
end
