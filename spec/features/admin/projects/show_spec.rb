require 'rails_helper_features'

RSpec.feature 'Deve mostrar um projeto' do
  given!(:admin) { create :user, :as_admin }
  given!(:project) { create :project }

  it 'Deve mostrar um projeto e suas associações' do
    sign_in_as_admin(admin)

    visit projects_path

    click_on "show_project_#{project.id}"

    expect(page).to have_text('Exibindo Projeto')
    expect(page).to have_text(project.nome)
    expect(page).to have_text(project.coordenador.nome)
    expect(page).to have_text(project.research_line.nome)
    expect(page).to have_text(project.situation.nome)
    expect(page).to have_text(project.scholarship_type.nome)
  end

end
