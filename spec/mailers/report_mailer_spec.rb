require "rails_helper"

RSpec.describe ReportMailer, :type => :mailer do
  let!(:report) { create :report }
  let!(:early_report_notification) { ReportMailer.early_report_notification(report) }

  describe "Deve testar todos os emails disparados pelo ReportMailer" do

    it "testa entrega do email early_report_notification" do
      deliveries = ActionMailer::Base.deliveries.count

      early_report_notification.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

  end
end
