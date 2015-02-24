class AddLinkCnpqGroup < ActiveRecord::Migration
  def change
    add_column :research_groups, :link_grupo_cnpq, :string
  end
end
