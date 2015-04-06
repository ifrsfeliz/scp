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

require 'test_helper'

class ReportAttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
