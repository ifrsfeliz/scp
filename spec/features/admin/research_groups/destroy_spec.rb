require 'rails_helper_features'

RSpec.feature 'Deleta um Grupo de Pesquisa' do
  given!(:admin) { create :user, :as_admin }
  given!(:research_group) { create :research_group }

  it 'deve deletar um grupo de pesquisa' do
    sign_in_as_admin(admin)

    visit research_groups_path

    expect(page).to have_text(research_group.nome)

    click_on "destroy_research_group_#{research_group.id}"

    expect(page).to have_text('Grupo de Pesquisa removido com sucesso.')
  end

end
