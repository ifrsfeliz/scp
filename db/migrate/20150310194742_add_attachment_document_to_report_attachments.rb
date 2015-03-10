class AddAttachmentDocumentToReportAttachments < ActiveRecord::Migration
  def self.up
    change_table :report_attachments do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :report_attachments, :file
  end
end
