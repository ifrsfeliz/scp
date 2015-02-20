class CreateProjectAttachments < ActiveRecord::Migration
  def up
    create_table :project_attachments do |t|
      t.references :project
      t.timestamps null: false
    end

    add_attachment :project_attachments, :file
  end

  def down
    drop_table :project_attachments
  end
end
