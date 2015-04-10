class AddAttachmentEditalToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :edital
    end
  end

  def self.down
    remove_attachment :projects, :edital
  end
end
