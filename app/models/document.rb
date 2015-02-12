class Document < ActiveRecord::Base
  belongs_to :student

  has_attached_file :file,
    :path => ":rails_root/public/files/:id/:filename",
    :url  => "/files/:id/:filename"

  do_not_validate_attachment_file_type :file

end
