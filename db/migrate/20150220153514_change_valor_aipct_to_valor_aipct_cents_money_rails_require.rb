class ChangeValorAipctToValorAipctCentsMoneyRailsRequire < ActiveRecord::Migration
  def change
    rename_column :projects, :valor_aipct, :valor_aipct_cents
  end
end
