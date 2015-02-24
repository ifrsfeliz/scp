class AddScholarshipTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :scholarship_type_id, :integer
  end
end
