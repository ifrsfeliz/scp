# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  nome               :string
#  researcher_id       :integer
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
  belongs_to :coordenador, foreign_key: 'researcher_id', class_name: 'Researcher'
  belongs_to :research_line
  belongs_to :situation
  belongs_to :scholarship_type

  has_many :reports, dependent: :destroy

  has_many :project_attachments, dependent: :destroy
  has_many :project_publications, dependent: :destroy

  has_many :member_students, dependent: :destroy
  has_many :students, through: :member_students

  has_many :member_researchers, dependent: :destroy
  has_many :researchers, through: :member_researchers


  # Configs
  monetize :valor_aipct_cents, as: 'valor_aipct' #https://github.com/RubyMoney/money-rails

  accepts_nested_attributes_for :member_students,
                                reject_if: :all_blank,
                                allow_destroy: true

  accepts_nested_attributes_for :member_researchers,
                                reject_if: :all_blank,
                                allow_destroy: true

  accepts_nested_attributes_for :reports,
                                reject_if: :all_blank,
                                allow_destroy: true

end
