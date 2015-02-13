require 'test_helper'

class ResearchLinesControllerTest < ActionController::TestCase
  setup do
    @research_line = research_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:research_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create research_line" do
    assert_difference('ResearchLine.count') do
      post :create, research_line: { nome: @research_line.nome, research_group_id: @research_line.research_group_id }
    end

    assert_redirected_to research_line_path(assigns(:research_line))
  end

  test "should show research_line" do
    get :show, id: @research_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @research_line
    assert_response :success
  end

  test "should update research_line" do
    patch :update, id: @research_line, research_line: { nome: @research_line.nome, research_group_id: @research_line.research_group_id }
    assert_redirected_to research_line_path(assigns(:research_line))
  end

  test "should destroy research_line" do
    assert_difference('ResearchLine.count', -1) do
      delete :destroy, id: @research_line
    end

    assert_redirected_to research_lines_path
  end
end
