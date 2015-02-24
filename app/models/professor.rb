# == Schema Information
#
# Table name: professors
#
#  id         :integer          not null, primary key
#  nome       :string
#  cpf        :string
#  rg         :string
#  email      :string
#  telefone   :string
#  celular    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Professor < ActiveRecord::Base

  # Associations
  has_many :documents, dependent: :destroy
  has_many :projects, through: :member_professors
end
