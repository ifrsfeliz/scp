require 'rails_helper_features'

RSpec.feature 'Deve entregar um relatório como pesquisador' do
  given!(:admin) { create :user, :as_admin }
  given!(:report) { create :report, avaliacao: 'Aguardando Avaliação' }
  given!(:report_entregue) { create :report, entregue: true }

  it 'Deve acessar o relatório e enviar as informações do projeto' do
    visit report_form_deliver_path(report, access_token: report.access_token)

    expect(page).to have_text("Entrega de Relatório")

    fill_in 'report_atividades_desenvolvidas', with: 'Atividade desenvolvida...'
    fill_in 'report_resultados_obtidos',       with: 'Resultados obtidos...'
    fill_in 'report_dificuldades_encontradas', with: 'Dificuldades encontradas...'

    attach_file 'report_attachments', File.join(Rails.root, '/spec/fixtures/blank.pdf')

    click_on 'Enviar Relatório'

    expect(page).to have_text('Relatório enviado com sucesso!')
  end

  it 'Não deve deixar acessar relatório que já foi entregue' do
    visit report_form_deliver_path(report_entregue, access_token: report_entregue.access_token)

    expect(page).to have_text("Esse formulário já foi enviado, caso necessite fazer alterações solicite a reabertura do relatório.")
  end

  it 'Não deve deixar acessar relatório com access token inválido' do
    visit report_form_deliver_path(report_entregue, access_token: 'abcdef')

    expect(page).to have_text("Você não tem acesso à essa página")
  end





end
