class SystemMailer < ApplicationMailer

  def notificacao_prestacao_de_contas_aipct_antecipada(p)
    @project = p
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: @config['email_report_managers'], subject: "AIPCT - Prestação de Contas")
  end

  def notificacao_prestacao_de_contas_aipct_no_dia(p)
    @project = p
    @coordenador = @project.coordenador

    mail(to: @coordenador.email, cc: @config['email_report_managers'], subject: "AIPCT - Prestação de Contas")
  end

  def testar_envio_de_email
    mail(to: User.first.email, subject: "E-mail de teste do SCP")
  end
end
