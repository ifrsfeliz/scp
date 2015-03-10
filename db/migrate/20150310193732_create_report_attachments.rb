class CreateReportAttachments < ActiveRecord::Migration
  def change
    create_table :report_attachments do |t|
      t.belongs_to :report, index: true

      t.timestamps null: false
    end
    add_foreign_key :report_attachments, :reports
  end
end
