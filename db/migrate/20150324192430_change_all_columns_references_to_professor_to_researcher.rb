class ChangeAllColumnsReferencesToProfessorToResearcher < ActiveRecord::Migration
  def change
    remove_column :documents, :professor_id
    add_column :documents, :researcher_id, :integer

    rename_table :member_professors, :member_researchers

    remove_column :member_researchers, :professor_id
    add_column :member_researchers, :researcher_id, :integer

    remove_column :projects, :professor_id
    add_column :projects, :professor_id, :integer

    remove_column :research_groups, :professor_id
    add_column :research_groups, :professor_id, :integer
  end
end
