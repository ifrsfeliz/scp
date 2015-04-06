# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  cpf        :string(255)
#  rg         :string(255)
#  email      :string(255)
#  telefone   :string(255)
#  celular    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
