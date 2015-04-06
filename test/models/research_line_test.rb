# == Schema Information
#
# Table name: research_lines
#
#  id                :integer          not null, primary key
#  nome              :string(255)
#  research_group_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ResearchLineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
