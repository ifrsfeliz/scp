class ReportMailer < ApplicationMailer

  before_filter :load_config_data

  def early_report_notification(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: @config['email_report_managers'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def on_day_report_notification(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: @config['email_report_managers'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def first_delayed_report_notification(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: @config['email_report_managers'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def others_delayed_report_notification(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: @config['email_report_managers'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  private
  def load_config_data
    @config = YAML.load_file('config/settings.yml')[Rails.env];
  end

end
