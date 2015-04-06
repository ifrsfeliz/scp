# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area < ActiveRecord::Base

  # Associations
  has_many :research_groups

  # Validations
  validates_presence_of :nome

end
