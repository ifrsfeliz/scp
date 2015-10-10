class ApplicationMailer < ActionMailer::Base

  default from: "sistemas@feliz.ifrs.edu.br"
  layout 'mailer'

  before_action :load_settings


  def load_settings
    @config = YAML.load_file('config/settings.yml')[Rails.env];
  end
end
