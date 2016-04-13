require 'rails_helper_features'

RSpec.feature 'Pede reformulação e aceita um relatorio' do
  given!(:admin) { create :user, :as_admin }
  given!(:user) { create :user }
  given!(:report) { create :report, avaliacao: 'Aguardando Avaliação' }

  it 'Não deve mostrar campos que somente admin pode visualizar' do
    sign_in_as_admin(user)

    visit report_path(report)

    expect(page).to have_text('Exibindo Relatório')
    expect(page).to have_text(report.project.nome)

    expect(page).to_not have_text("Reformular")
    expect(page).to_not have_text("Aprovar")
  end


  it 'Pede reformulação para retirada de um anexo' do
    # Admin pede reformulação
    sign_in_as_admin(admin)
    visit report_path(report)
    click_on 'Reformular'

    # Acessa página de envio de relatório e anexa um arquivo
    visit report_form_deliver_path(report, access_token: report.access_token)
    attach_file 'report_attachments', File.join(Rails.root, '/spec/fixtures/blank.pdf')
    click_on 'Enviar Relatório'
    expect(page).to have_text('Relatório enviado com sucesso!')

    # Admin acessa relatório, pede nova reformulação para usuário retirar anexo
    visit report_path(report)
    click_on 'Reformular'

    # Usuário retira anexo
    visit report_form_deliver_path(report, access_token: report.access_token)
    click_on "destroy_report_attachment_#{report.report_attachments.first.id}"

    expect(page).to have_text('Anexo deletado com sucesso.')
  end

end
