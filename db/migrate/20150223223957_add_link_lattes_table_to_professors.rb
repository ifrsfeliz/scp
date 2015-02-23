class AddLinkLattesTableToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :link_lattes, :string
  end
end
