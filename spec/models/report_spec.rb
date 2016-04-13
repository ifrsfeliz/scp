require 'rails_helper'

RSpec.describe Report, :type => :model do

  describe 'Testa os envios de notificações feitas pelo model Report' do

    it 'Testa o método report_request_notification' do
      # Relatório com 15 dias para a entrega, deve enviar email de notificacao antecipada
      report = FactoryGirl.create(:report, periodo_desenvolvimento_fim: Date.today - 15.days)
      Report.report_request_notification
      expect(report.reload.notificacao_antecipada).to eq(true)

      # Altera a data do periodo_desenvolvimento_fim para que seja enviada notificacao no dia
      report.periodo_desenvolvimento_fim = Date.today
      report.save
      deliveries = ActionMailer::Base.deliveries.count
      Report.report_request_notification
      expect(report.reload.notificacao_no_dia).to eq(true)
      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)

      # Envia notificacao de relatorio atrasado, após 15 dias
      report.periodo_desenvolvimento_fim = Date.today + 15.days
      report.save
      deliveries = ActionMailer::Base.deliveries.count
      Report.report_request_notification
      expect(report.reload.notificacao_atrasada).to eq(true)
      expect(report.reload.ultima_data_notificacao_atrasada).to eq(Date.today)
      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)

      # Envia notificacao de relatorio atrasado a cada 15 dias (15, 30, 45, 60, infinitamente)
      report.ultima_data_notificacao_atrasada = Date.today + 30.days
      report.save
      deliveries = ActionMailer::Base.deliveries.count
      Report.report_request_notification
      expect(report.reload.ultima_data_notificacao_atrasada).to eq(Date.today)
      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)

      report.ultima_data_notificacao_atrasada = Date.today + 45.days
      report.save
      deliveries = ActionMailer::Base.deliveries.count
      Report.report_request_notification
      expect(report.reload.ultima_data_notificacao_atrasada).to eq(Date.today)
      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

  end

end
