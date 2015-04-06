# == Schema Information
#
# Table name: research_groups
#
#  id                 :integer          not null, primary key
#  nome               :string(255)
#  researcher_id      :integer
#  ultima_verificacao :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  link_grupo_cnpq    :string(255)
#  area_id            :integer
#

require 'test_helper'

class ResearchGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
