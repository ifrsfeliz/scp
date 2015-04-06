# == Schema Information
#
# Table name: reports
#
#  id                               :integer          not null, primary key
#  atividades_desenvolvidas         :text(65535)
#  resultados_obtidos               :text(65535)
#  dificuldades_encontradas         :text(65535)
#  proximas_etapas                  :text(65535)
#  conclusoes                       :text(65535)
#  referencias                      :text(65535)
#  notificacao_antecipada           :boolean
#  notificacao_no_dia               :boolean
#  notificacao_atrasada             :boolean
#  project_id                       :integer
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  entregue                         :boolean
#  access_token                     :string(255)
#  periodo_desenvolvimento_inicio   :date
#  periodo_desenvolvimento_fim      :date
#  avaliacao                        :string(255)
#  ultima_data_notificacao_atrasada :date
#  observacao_reformular            :text(65535)
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
