require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get regras" do
    get :regras
    assert_response :success
  end

  test "should get cadastro" do
    get :cadastro
    assert_response :success
  end

  test "should get ranking" do
    get :ranking
    assert_response :success
  end

end
