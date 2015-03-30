class Report < ActiveRecord::Base
  #Associations
  belongs_to :project
  has_many :report_attachments, dependent: :destroy

  # Callbacks
  before_create :generate_access_token
  
  def self.report_request_notification
    reports = Report.where(entregue: [nil, false])

    #today = Date.parse('02-04-2015')
    #today = Date.parse('18-03-2015')
    today = Date.today

    reports.each do |r|
      if (r.notificacao_antecipada.nil? && r.periodo_desenvolvimento_fim - 15 <= today) # 15 days early or next the deliver date
        mail = ReportMailer.early_report_notification(r).deliver

        if mail
          r.notificacao_antecipada = true
          r.save
        end

      elsif (r.notificacao_no_dia.nil? && r.periodo_desenvolvimento_fim <= today) # today notification
        mail = ReportMailer.on_day_report_notification(r).deliver

        if mail
          r.notificacao_no_dia = true
          r.save
        end

      elsif (r.notificacao_atrasada.nil? && r.periodo_desenvolvimento_fim + 15 == today)
        mail = ReportMailer.first_delayed_report_notification(r).deliver

        if mail
          r.notificacao_atrasada = true
          r.ultima_data_notificacao_atrasada = today
          r.save
        end

      # notificacao_atrasada significa que já foi entregue
      elsif (r.notificacao_atrasada == true && r.ultima_data_notificacao_atrasada + 15 == today)
        mail = ReportMailer.others_delayed_report_notification(r).deliver

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
