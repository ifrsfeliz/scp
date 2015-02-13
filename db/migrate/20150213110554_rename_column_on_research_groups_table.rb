class RenameColumnOnResearchGroupsTable < ActiveRecord::Migration
  def change
    rename_column :research_groups, :ultima_atualizacao, :ultima_verificacao
  end
end
