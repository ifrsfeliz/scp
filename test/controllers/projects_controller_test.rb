require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { auxilio_aipct: @project.auxilio_aipct, data_fim: @project.data_fim, data_inicio: @project.data_inicio, link_cnpq: @project.link_cnpq, nome: @project.nome, nome_edital: @project.nome_edital, numero_suap: @project.numero_suap, professor_id: @project.professor_id, research_line_id: @project.research_line_id, situation_id: @project.situation_id, ultima_verificacao: @project.ultima_verificacao, valor_aipct: @project.valor_aipct }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { auxilio_aipct: @project.auxilio_aipct, data_fim: @project.data_fim, data_inicio: @project.data_inicio, link_cnpq: @project.link_cnpq, nome: @project.nome, nome_edital: @project.nome_edital, numero_suap: @project.numero_suap, professor_id: @project.professor_id, research_line_id: @project.research_line_id, situation_id: @project.situation_id, ultima_verificacao: @project.ultima_verificacao, valor_aipct: @project.valor_aipct }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
