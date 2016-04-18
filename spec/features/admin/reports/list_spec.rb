require 'rails_helper_features'

RSpec.feature 'Deve mostrar relatório com avaliação pendente' do
  given!(:admin) { create :user, :as_admin }
  given!(:report) { create :report, status: Report.statuses[:em_avaliacao]}
  given!(:report2) { create :report }

  it 'Deve mostrar relatórios pendentes' do
    sign_in_as_admin(admin)

    visit reports_path

    expect(page).to     have_text(report.project.nome)
    expect(page).to_not have_text(report2.project.nome)
  end

  it 'Deve aprovar um relatório' do
    sign_in_as_admin(admin)

    visit reports_path

    click_on "show_report_#{report.id}"

    deliveries = ActionMailer::Base.deliveries.count

    click_on "Aprovar"

    expect(page).to have_text('Relatório aprovado com sucesso')

    expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)

  end

  it 'Deve solicitar reformulação de relatório' do
    sign_in_as_admin(admin)

    visit reports_path

    click_on "show_report_#{report.id}"

    deliveries = ActionMailer::Base.deliveries.count

    click_on "Reformular"

    expect(page).to have_text('Pedido de reformulação enviado com sucesso!')

    expect(ActionMailer::Base.deliveries.count).to eq(deliveries + 1)

  end

end
