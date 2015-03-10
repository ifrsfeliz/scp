class MemberStudentMailer < ApplicationMailer

  before_filter :load_config_data

  def early_report_notification(ms)
    @member_student = ms
    @project = @member_student.project
    @coordenador = @project.coordenador
    @student = @member_student.student

    mail(to: [@coordenador.email, @student.email], cc: @config['email_report_managers'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def on_day_report_notification(ms)
    @member_student = ms
    @project = @member_student.project
    @coordenador = @project.coordenador
    @student = @member_student.student

    mail(to: [@coordenador.email, @student.email] , cc: @config['email_report_managers'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def first_delayed_report_notification(ms)
    @member_student = ms
    @project = @member_student.project
    @coordenador = @project.coordenador
    @student = @member_student.student

    mail(to: [@coordenador.email, @student.email], cc: @config['email_report_managers'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  def others_delayed_report_notification(ms)
    @member_student = ms
    @project = @member_student.project
    @coordenador = @project.coordenador
    @student = @member_student.student

    mail(to: [@coordenador.email, @student.email], cc: @config['email_report_managers'], subject: "Notificação de Relatório - #{@project.nome}")
  end

  private
  def load_config_data
    @config = YAML.load_file('config/settings.yml')[Rails.env];
  end

end
