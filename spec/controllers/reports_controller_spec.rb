require 'rails_helper_features'

RSpec.describe ReportsController do
  describe "Não deve deixar aprovar ou reformular um relatório sem permissão" do
    it "tenta aprovar um relatório como visitante" do
      put :approve, id: 2

      expect(response).to redirect_to(new_user_session_path)
    end

    it "tenta aprovar um relatório como usuário comum" do
      report = FactoryGirl.create(:report)
      user = FactoryGirl.create(:user)
      sign_in(user)

      put :approve, id: report.id

      expect(flash[:notice]).to have_text('Você não tem permissão de executar essa ação.')
    end

    it "tenta reformular um relatório como visitante" do
      put :reformulate, id: 2

      expect(response).to redirect_to(new_user_session_path)
    end

    it "tenta reformular um relatório como usuário comum" do
      report = FactoryGirl.create(:report)
      user = FactoryGirl.create(:user)
      sign_in(user)

      put :reformulate, id: report.id

      expect(flash[:notice]).to have_text('Você não tem permissão de executar essa ação.')
    end

  end
end
