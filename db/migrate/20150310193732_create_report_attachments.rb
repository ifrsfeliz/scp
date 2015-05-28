class CreateReportAttachments < ActiveRecord::Migration
  def change
    create_table :report_attachments do |t|
      t.belongs_to :report

      t.timestamps null: false
    end
  end
end
