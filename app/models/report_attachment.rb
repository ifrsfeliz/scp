class ReportAttachment < ActiveRecord::Base
  belongs_to :report

  has_attached_file :file,
    :path => ":rails_root/public/files/:class/:id/:filename",
    :url  => "/files/:class/:id/:filename"

  do_not_validate_attachment_file_type :file
end
