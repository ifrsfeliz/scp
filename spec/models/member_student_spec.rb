require 'rails_helper'

RSpec.describe MemberStudent, :type => :model do

  describe 'Testa os envios de notificações feitas pelo model Member Student' do

    it 'Testa o método report_request_notification' do
      # Relatório com 15 dias para a entrega, deve enviar email de notificacao antecipada
      member_student = FactoryGirl.create(:member_student, data_fim: Date.today - 15.days)
      deliveries = ActionMailer::Base.deliveries.count
      MemberStudent.report_request_notification
      expect(member_student.reload.notificacao_antecipada).to eq(true)
      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)

      # Altera a data_fim para que seja enviada notificacao no dia
      member_student.data_fim = Date.today
      member_student.save
      deliveries = ActionMailer::Base.deliveries.count
      MemberStudent.report_request_notification
      expect(member_student.reload.notificacao_no_dia).to eq(true)
      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)

      # Envia notificacao de relatorio atrasado, após 15 dias
      member_student.data_fim = Date.today - 15.days
      member_student.save
      deliveries = ActionMailer::Base.deliveries.count
      MemberStudent.report_request_notification
      expect(member_student.reload.notificacao_atrasada).to eq(true)
      expect(member_student.reload.ultima_data_notificacao_atrasada).to eq(Date.today)
      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)

      # Envia notificacao de relatorio atrasado a cada 15 dias (15, 30, 45, 60, infinitamente)
      member_student.ultima_data_notificacao_atrasada = Date.today - 30.days
      member_student.save
      deliveries = ActionMailer::Base.deliveries.count
      MemberStudent.report_request_notification
      expect(member_student.reload.ultima_data_notificacao_atrasada).to eq(Date.today)
      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

  end

end
