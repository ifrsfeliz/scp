# == Schema Information
#
# Table name: reports
#
#  id                               :integer          not null, primary key
#  atividades_desenvolvidas         :text(65535)
#  resultados_obtidos               :text(65535)
#  dificuldades_encontradas         :text(65535)
#  proximas_etapas                  :text(65535)
#  conclusoes                       :text(65535)
#  referencias                      :text(65535)
#  notificacao_antecipada           :boolean
#  notificacao_no_dia               :boolean
#  notificacao_atrasada             :boolean
#  project_id                       :integer
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  entregue                         :boolean
#  access_token                     :string(255)
#  periodo_desenvolvimento_inicio   :date
#  periodo_desenvolvimento_fim      :date
#  avaliacao                        :string(255)
#  ultima_data_notificacao_atrasada :date
#  observacao_reformular            :text(65535)
#

class Report < ActiveRecord::Base
  # Associations
  belongs_to :project
  has_many :report_attachments, dependent: :destroy

  # Callbacks
  before_create :generate_access_token

  # Validations
  validates_presence_of :periodo_desenvolvimento_inicio, :periodo_desenvolvimento_fim

  def self.report_request_notification
    reports = Report.where(entregue: [nil, false])

    today = Date.today

    reports.each do |r|
      if (r.notificacao_antecipada.nil? && r.periodo_desenvolvimento_fim - 15 <= today) # 15 days early or next the deliver date
        mail = ReportMailer.early_report_notification(r).deliver_now

        if mail
          r.notificacao_antecipada = true
          r.save
        end

      elsif (r.notificacao_no_dia.nil? && r.periodo_desenvolvimento_fim <= today) # today notification
        mail = ReportMailer.on_day_report_notification(r).deliver_now

        if mail
          r.notificacao_no_dia = true
          r.save
        end

      elsif (r.notificacao_atrasada.nil? && r.periodo_desenvolvimento_fim + 15 >= today)
        mail = ReportMailer.first_delayed_report_notification(r).deliver_now

        if mail
          r.notificacao_atrasada = true
          r.ultima_data_notificacao_atrasada = today
          r.save
        end

      # notificacao_atrasada significa que já foi entregue outras notificacoes
      elsif (r.notificacao_atrasada == true && r.ultima_data_notificacao_atrasada + 15 >= today)
        mail = ReportMailer.others_delayed_report_notification(r).deliver_now

        if mail
          r.ultima_data_notificacao_atrasada = today
          r.save
        end
      end
    end

  end

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

end
