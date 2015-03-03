class ReportMailer < ApplicationMailer

  def early_report_notification
    @professor  = 'Bastião'
    mail(to: 'mauricio.ferreira@feliz.ifrs.edu.br', subject: 'Projeto Teste - ....')
  end
end
