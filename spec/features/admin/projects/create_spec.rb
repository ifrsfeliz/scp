require 'rails_helper_features'

RSpec.feature 'Cria Projeto' do
  given!(:admin) { create :user, :as_admin }
  given!(:research_line) { create :research_line }
  given!(:researcher) { create :researcher }
  given!(:scholarship_type) { create :scholarship_type }
  given!(:situation) { create :situation }

  context "Inclusão de Projeto no SCP" do

    it 'cria uma novo projeto com dados válidos' do
      sign_in_as_admin(admin)

      visit projects_path

      click_on 'Novo Projeto'

      fill_in 'project_nome', with: 'Teste'
      fill_in 'project_valor_aipct', with: '0'
      fill_in 'project_data_inicio', with: '15/05/2016'
      fill_in 'project_data_fim', with: '15/07/2016'
      fill_in 'project_numero_suap', with: '1235678'
      fill_in 'project_nome_edital', with: 'Nome do Edital blabla'
      select "#{research_line.nome}", from: "project_research_line_id"
      select "#{researcher.nome}", from: "project_researcher_id"
      select "#{scholarship_type.nome}", from: "project_scholarship_type_id"
      select "#{situation.nome}", from: "project_situation_id"
      attach_file 'project_edital', File.join(Rails.root, '/spec/fixtures/blank.pdf')
      attach_file 'project_attachments', File.join(Rails.root, '/spec/fixtures/blank.pdf')
      attach_file 'project_publications', File.join(Rails.root, '/spec/fixtures/blank.pdf')

      click_on 'Salvar'

      project = Project.first

      expect(page).to have_text("Projeto criado com sucesso.")
      expect(project.edital_file_name).to eq("blank.pdf")
      expect(project.project_attachments.count).to eq(1)
      expect(project.project_publications.count).to eq(1)

      click_on 'destroy_project_edital'
      expect(page).to have_text('Edital deletado com sucesso.')

      click_on "destroy_project_attachment_#{project.project_attachments.first.id}"
      expect(page).to have_text('Anexo deletado com sucesso.')

      click_on "destroy_project_publication_#{project.project_publications.first.id}"
      expect(page).to have_text('Publicação deletada com sucesso.')
    end

    it 'cria uma novo projeto com dados inválidos' do
      sign_in_as_admin(admin)

      visit projects_path

      click_on 'Novo Projeto'

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end

end
