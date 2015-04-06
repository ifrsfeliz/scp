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

class ResearchGroup < ActiveRecord::Base

  # Associations
  belongs_to :researcher
  belongs_to :area
  has_many :research_lines

  # Validations
  validates_presence_of :nome, :researcher, :link_grupo_cnpq, :area, :ultima_verificacao

end
