class MemberProfessor < ActiveRecord::Base
  belongs_to :project
  belongs_to :professor
end
