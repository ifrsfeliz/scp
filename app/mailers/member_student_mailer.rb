class MemberStudentMailer < ApplicationMailer

  def early_report_notification(ms)
    @member_student = ms
    @project = @member_student.project
    @coordenador = @project.coordenador
    @student = @member_student.student

    mail(to: [@coordenador.email, @student.email], cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def on_day_report_notification(ms)
    @member_student = ms
    @project = @member_student.project
    @coordenador = @project.coordenador
    @student = @member_student.student

    mail(to: [@coordenador.email, @student.email] , cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def first_delayed_report_notification(ms)
    @member_student = ms
    @project = @member_student.project
    @coordenador = @project.coordenador
    @student = @member_student.student

    mail(to: [@coordenador.email, @student.email], cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def others_delayed_report_notification(ms)
    @member_student = ms
    @project = @member_student.project
    @coordenador = @project.coordenador
    @student = @member_student.student

    mail(to: [@coordenador.email, @student.email], cc: ENV['EMAIL_REPORT_MANAGERS'], subject: "Notificação de Relatório - #{@project.nome}")
  end

end
