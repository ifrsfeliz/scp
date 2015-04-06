# == Schema Information
#
# Table name: member_researchers
#
#  id            :integer          not null, primary key
#  project_id    :integer
#  researcher_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class MemberResearcher < ActiveRecord::Base

  # Associations
  belongs_to :project
  belongs_to :researcher

  # Validations
  validates_presence_of :researcher

end
