class Report < ActiveRecord::Base
  #Associations
  belongs_to :project

  # Callbacks
  before_create :generate_access_token
  
  def self.report_request_notification
    ReportMailer.early_report_notification.deliver
  end

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

end
