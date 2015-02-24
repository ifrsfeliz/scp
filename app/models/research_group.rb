# == Schema Information
#
# Table name: research_groups
#
#  id                 :integer          not null, primary key
#  nome               :string
#  professor_id       :integer
#  ultima_verificacao :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ResearchGroup < ActiveRecord::Base
  belongs_to :professor
  belongs_to :area

  has_many :research_lines
end
