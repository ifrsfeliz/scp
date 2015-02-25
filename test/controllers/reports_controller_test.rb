require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post :create, report: { atividades_desenvolvidades: @report.atividades_desenvolvidades, conclusoes: @report.conclusoes, data_entrega: @report.data_entrega, dificuldades_encontradas: @report.dificuldades_encontradas, notificacao_antecipada: @report.notificacao_antecipada, notificacao_atrasada: @report.notificacao_atrasada, notificacao_no_dia: @report.notificacao_no_dia, project_id: @report.project_id, proximas_etapas: @report.proximas_etapas, referencias: @report.referencias, resultados_obtidos: @report.resultados_obtidos }
    end

    assert_redirected_to report_path(assigns(:report))
  end

  test "should show report" do
    get :show, id: @report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    patch :update, id: @report, report: { atividades_desenvolvidades: @report.atividades_desenvolvidades, conclusoes: @report.conclusoes, data_entrega: @report.data_entrega, dificuldades_encontradas: @report.dificuldades_encontradas, notificacao_antecipada: @report.notificacao_antecipada, notificacao_atrasada: @report.notificacao_atrasada, notificacao_no_dia: @report.notificacao_no_dia, project_id: @report.project_id, proximas_etapas: @report.proximas_etapas, referencias: @report.referencias, resultados_obtidos: @report.resultados_obtidos }
    assert_redirected_to report_path(assigns(:report))
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end
end
