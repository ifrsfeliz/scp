class ReportMailer < ApplicationMailer

  def early_report_notification(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def on_day_report_notification(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def first_delayed_report_notification(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def others_delayed_report_notification(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def reformulate_report(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de relatório - #{@project.nome}")
  end

  def approved_report(r)
    @report = r
    @project = @report.project
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de relatório - #{@project.nome}")
  end

end
