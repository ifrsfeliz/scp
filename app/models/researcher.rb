# == Schema Information
#
# Table name: researchers
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

class Researcher < ActiveRecord::Base

  # Associations
  has_many :documents, dependent: :destroy
  has_many :member_researchers
  has_many :projects

end
