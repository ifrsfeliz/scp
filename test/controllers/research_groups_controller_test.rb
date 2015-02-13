require 'test_helper'

class ResearchGroupsControllerTest < ActionController::TestCase
  setup do
    @research_group = research_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research_group" do
    assert_difference('ResearchGroup.count') do
      post :create, research_group: { nome: @research_group.nome, professor_id: @research_group.professor_id, ultima_verificacao: @research_group.ultima_verificacao }
    end

    assert_redirected_to research_group_path(assigns(:research_group))
  end

  test "should show research_group" do
    get :show, id: @research_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @research_group
    assert_response :success
  end

  test "should update research_group" do
    patch :update, id: @research_group, research_group: { nome: @research_group.nome, professor_id: @research_group.professor_id, ultima_verificacao: @research_group.ultima_verificacao }
    assert_redirected_to research_group_path(assigns(:research_group))
  end

  test "should destroy research_group" do
    assert_difference('ResearchGroup.count', -1) do
      delete :destroy, id: @research_group
    end

    assert_redirected_to research_groups_path
  end
end
