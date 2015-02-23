# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  nome               :string
#  professor_id       :integer
#  data_inicio        :date
#  data_fim           :date
#  numero_suap        :string
#  nome_edital        :string
#  link_cnpq          :string
#  ultima_verificacao :datetime
#  auxilio_aipct      :boolean
#  valor_aipct        :integer
#  research_line_id   :integer
#  situation_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Project < ActiveRecord::Base

  # Associations
  belongs_to :coordenador, foreign_key: 'professor_id', class_name: 'Professor'
  belongs_to :research_line
  belongs_to :situation

  has_many :project_attachments, dependent: :destroy
  has_many :project_publications, dependent: :destroy

  has_many :member_students
  has_many :students, through: :member_students

  has_many :member_professors
  has_many :professors, through: :member_professors

  # Configs
  monetize :valor_aipct_cents, as: 'valor_aipct' #https://github.com/RubyMoney/money-rails

  accepts_nested_attributes_for :member_students,
                                reject_if: :all_blank,
                                allow_destroy: true

  accepts_nested_attributes_for :member_professors,
                                reject_if: :all_blank,
                                allow_destroy: true
end
