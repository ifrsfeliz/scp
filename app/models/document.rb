# == Schema Information
#
# Table name: documents
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  student_id        :integer
#  researcher_id      :integer
#

class Document < ActiveRecord::Base
  belongs_to :student
  belongs_to :researcher

  has_attached_file :file,
    :path => ":rails_root/public/files/:class/:id/:filename",
    :url  => "/files/:class/:id/:filename"

  do_not_validate_attachment_file_type :file

end
