require 'rails_helper_features'

RSpec.feature 'Pede reformulação e aceita um relatorio' do
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

end
