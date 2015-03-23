class RemoveColumnsFromReports < ActiveRecord::Migration
  def up
    remove_column :projects, :ultima_verificacao
    remove_column :projects, :link_cnpq
  end

  def down
    add_column :projects, :ultima_verificacao, :date
    add_column :projects, :link_cnpq, :string
  end
end
