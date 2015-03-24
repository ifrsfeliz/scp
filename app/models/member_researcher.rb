class MemberResearcher < ActiveRecord::Base
  belongs_to :project
  belongs_to :researcher
end
