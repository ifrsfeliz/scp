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

class Student < ActiveRecord::Base

  # Associations
  has_many :documents, dependent: :destroy
  has_many :member_students
  has_many :projects, through: :member_students

  # Validations
  validates_presence_of :nome, :cpf, :rg, :email, :telefone

end
