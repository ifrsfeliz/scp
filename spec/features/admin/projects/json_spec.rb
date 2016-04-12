require 'rails_helper_features'

RSpec.feature 'Cria Projeto' do
  given!(:admin) { create :user, :as_admin }
  given!(:project_1) { create :project, data_inicio: '2016-01-01 15:00:00 UTC', data_fim: '2016-12-01 15:00:00 UTC' }
  given!(:project_2) { create :project, data_inicio: '2015-01-03 15:00:00 UTC', data_fim: '2015-12-01 15:00:00 UTC' }

  context "Teste dos JSONs para os gráficos" do

    it 'testa o JSON por grupo de pesquisa' do
      sign_in_as_admin(admin)

      visit projects_per_research_group_path(format: :json)

      json = JSON.parse(page.body)

      expect(json.first['y']).to eq(ResearchGroup.where(nome: json.first['label']).first.research_lines.first.projects.count)
      expect(json.second['y']).to eq(ResearchGroup.where(nome: json.second['label']).first.research_lines.first.projects.count)
    end

    it 'testa o JSON por ano' do
      sign_in_as_admin(admin)

      visit projects_per_year_path(format: :json)

      json = JSON.parse(page.body)

      expect(json.first['label']).to eq(2015)
      expect(json.first['y']).to eq(1)

      expect(json.second['label']).to eq(2016)
      expect(json.second['y']).to eq(1)
    end
  end

end
