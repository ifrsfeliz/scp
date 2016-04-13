require "rails_helper"

RSpec.describe MemberStudentMailer, :type => :mailer do
  let!(:member_student) { create :member_student }
  let!(:early_report_notification) { MemberStudentMailer.early_report_notification(member_student) }
  let!(:on_day_report_notification) { MemberStudentMailer.on_day_report_notification(member_student) }
  let!(:first_delayed_report_notification) { MemberStudentMailer.first_delayed_report_notification(member_student) }
  let!(:others_delayed_report_notification) { MemberStudentMailer.others_delayed_report_notification(member_student) }

  describe "Deve testar todos os emails disparados pelo member_students_mailer" do

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

  end
end
