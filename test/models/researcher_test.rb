# == Schema Information
#
# Table name: researchers
#
#  id          :integer          not null, primary key
#  nome        :string(255)
#  cpf         :string(255)
#  rg          :string(255)
#  email       :string(255)
#  telefone    :string(255)
#  celular     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  link_lattes :string(255)
#

require 'test_helper'

class ResearcherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
