require "rails_helper"

RSpec.describe ReportMailer, :type => :mailer do
  let!(:report) { create :report }
  let!(:early_report_notification) { ReportMailer.early_report_notification(report) }
  let!(:on_day_report_notification) { ReportMailer.on_day_report_notification(report) }
  let!(:first_delayed_report_notification) { ReportMailer.first_delayed_report_notification(report) }
  let!(:others_delayed_report_notification) { ReportMailer.others_delayed_report_notification(report) }
  let!(:reformulate_report) { ReportMailer.reformulate_report(report) }
  let!(:approved_report) { ReportMailer.approved_report(report) }

  describe "Deve testar todos os emails disparados pelo ReportMailer" do

    it "testa entrega do email early_report_notification" do
      deliveries = ActionMailer::Base.deliveries.count

      early_report_notification.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

    it "testa entrega do email on_day_report_notification" do
      deliveries = ActionMailer::Base.deliveries.count

      on_day_report_notification.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

    it "testa entrega do email first_delayed_report_notification" do
      deliveries = ActionMailer::Base.deliveries.count

      first_delayed_report_notification.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

    it "testa entrega do email others_delayed_report_notification" do
      deliveries = ActionMailer::Base.deliveries.count

      others_delayed_report_notification.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

    it "testa entrega do email reformulate_report" do
      deliveries = ActionMailer::Base.deliveries.count

      reformulate_report.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

    it "testa entrega do email approved_report" do
      deliveries = ActionMailer::Base.deliveries.count

      approved_report.deliver_now

      expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)
    end

  end
end
