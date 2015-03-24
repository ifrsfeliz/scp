class ChangeTableNameProfessorsToResearchers < ActiveRecord::Migration
  def change
    rename_table :professors, :researchers
  end
end
