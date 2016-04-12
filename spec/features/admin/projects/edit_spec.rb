require 'rails_helper_features'

RSpec.feature 'Edita Projeto' do
  given!(:admin) { create :user, :as_admin }
  given!(:project) { create :project }

  context "Edição de projetos no SCP" do

    it 'Edita um projeto existente com dados válidos' do
      sign_in_as_admin(admin)

      visit projects_path

      expect(page).to have_text(project.nome)

      click_on "edit_project_#{project.id}"

      fill_in 'project_nome', with: 'Teste 2'

      attach_file 'project_attachments', File.join(Rails.root, '/spec/fixtures/blank.pdf')
      attach_file 'project_publications', File.join(Rails.root, '/spec/fixtures/blank.pdf')

      click_on 'Salvar'

      expect(page).to have_text("Projeto atualizado com sucesso.")
      expect(project.reload.nome).to eq('Teste 2')
    end

    it 'Edita um projeto com dados inválidos' do
      sign_in_as_admin(admin)

      visit projects_path

      click_on "edit_project_#{project.id}"

      fill_in 'project_nome', with: ''

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end
end
