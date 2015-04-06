# == Schema Information
#
# Table name: scholarship_types
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ScholarshipType < ActiveRecord::Base

  # Associations
  has_many :projects

  # Validations
  validates_presence_of :nome

end
