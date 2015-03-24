namespace :system do
  desc "Notifica todos os pesquisadores sobre a Prestação de Contas - AIPCT"
  task notificacao_aipct_antecipada: :environment do
    projects = Project.where(auxilio_aipct: true)

    projects.each do |p|
      SystemMailer.notificacao_prestacao_de_contas_aipct_antecipada(p).deliver_now
    end

  end

  desc "Notifica todos os pesquisadores sobre a Prestação de Contas - AIPCT"
  task notificacao_aipct_no_dia: :environment do
    projects = Project.where(auxilio_aipct: true)

    projects.each do |p|
      SystemMailer.notificacao_prestacao_de_contas_aipct_no_dia(p).deliver_now
    end

  end

end
