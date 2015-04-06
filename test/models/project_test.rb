# == Schema Information
#
# Table name: projects
#
#  id                  :integer          not null, primary key
#  nome                :string(255)
#  researcher_id       :integer
#  data_inicio         :date
#  data_fim            :date
#  numero_suap         :string(255)
#  nome_edital         :string(255)
#  auxilio_aipct       :boolean
#  valor_aipct_cents   :integer
#  research_line_id    :integer
#  situation_id        :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  scholarship_type_id :integer
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
