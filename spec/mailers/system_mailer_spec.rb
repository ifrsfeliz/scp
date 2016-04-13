require "rails_helper"

RSpec.describe SystemMailer, :type => :mailer do
  let!(:project) { create :project }
  let!(:user) { create :user }
  let!(:notificacao_prestacao_de_contas_aipct_antecipada) { SystemMailer.notificacao_prestacao_de_contas_aipct_antecipada(project) }
  let!(:notificacao_prestacao_de_contas_aipct_no_dia) { SystemMailer.notificacao_prestacao_de_contas_aipct_no_dia(project) }
  let!(:testar_envio_de_email) { SystemMailer.testar_envio_de_email }

  describe "Deve testar todos os emails disparados pelo Sistema" do

    it "testa entrega do email notificacao_prestacao_de_contas_aipct_antecipada" do
      deliveries = ActionMailer::Base.deliveries.count

      notificacao_prestacao_de_contas_aipct_antecipada.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

    it "testa entrega do email notificacao_prestacao_de_contas_aipct_no_dia" do
      deliveries = ActionMailer::Base.deliveries.count

      notificacao_prestacao_de_contas_aipct_no_dia.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

    it "testa entrega do email testar_envio_de_email" do
      deliveries = ActionMailer::Base.deliveries.count

      testar_envio_de_email.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

  end
end
