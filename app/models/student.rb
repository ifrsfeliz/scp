# == Schema Information
#
# Table name: students
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

class Student < ActiveRecord::Base

  # Associations
  has_many :documents, dependent: :destroy
  has_many :member_students
  has_many :projects, through: :member_students

end
