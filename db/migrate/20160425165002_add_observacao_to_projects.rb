class AddObservacaoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :observacao, :text
  end
end
