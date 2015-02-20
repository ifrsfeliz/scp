class CreateProjectPublications < ActiveRecord::Migration
  def up
    create_table :project_publications do |t|
      t.references :project
      t.timestamps null: false
    end

    add_attachment :project_publications, :file
  end

  def down
    drop_table :project_publications
  end
end
