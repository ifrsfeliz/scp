# == Schema Information
#
# Table name: report_attachments
#
#  id                :integer          not null, primary key
#  report_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class ReportAttachment < ActiveRecord::Base
  belongs_to :report

  has_attached_file :file,
    :path => ":rails_root/public/files/:class/:id/:filename",
    :url  => "/files/:class/:id/:filename"

  do_not_validate_attachment_file_type :file
end
