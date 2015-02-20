# == Schema Information
#
# Table name: situations
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Situation < ActiveRecord::Base
end
