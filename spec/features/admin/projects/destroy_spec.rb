require 'rails_helper_features'

RSpec.feature 'Deleta um projeto' do
  given!(:admin) { create :user, :as_admin }
  given!(:project) { create :project }

  it 'deve deletar um projeto' do
    sign_in_as_admin(admin)

    visit projects_path

    expect(page).to have_text(project.nome)

    click_on "destroy_project_#{project.id}"

    expect(page).to have_text('Projeto removido com sucesso')
  end

end
