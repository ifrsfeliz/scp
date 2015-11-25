class ChangeAllColumnsReferencesToProfessorToResearcher < ActiveRecord::Migration
  def change
    rename_column :documents, :professor_id, :researcher_id

    rename_table :member_professors, :member_researchers

    rename_column :member_researchers, :professor_id, :researcher_id

    rename_column :projects, :professor_id, :researcher_id

    rename_column :research_groups, :professor_id, :researcher_id
  end
end
