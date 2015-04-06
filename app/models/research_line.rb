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

class ResearchLine < ActiveRecord::Base

  # Associations
  belongs_to :research_group
  has_many :projects

  # Validations
  validates_presence_of :nome, :research_group

end
