class Professor < ActiveRecord::Base
  has_many :documents, dependent: :destroy

end
