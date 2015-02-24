# == Schema Information
#
# Table name: research_lines
#
#  id                :integer          not null, primary key
#  nome              :string
#  research_group_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ResearchLine < ActiveRecord::Base
  belongs_to :research_group
  has_many :projects
end
