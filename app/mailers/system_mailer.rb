class SystemMailer < ApplicationMailer

  before_filter :load_config_data

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

  private
  def load_config_data
    @config = YAML.load_file('config/settings.yml')[Rails.env];
  end

end
