require 'test_helper'

class HumanNamesControllerTest < ActionController::TestCase
  setup do
    @human_name = human_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:human_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create human_name" do
    assert_difference('HumanName.count') do
      post :create, :human_name => { :description => @human_name.description, :gender => @human_name.gender, :is_forbidden => @human_name.is_forbidden, :is_natural => @human_name.is_natural, :name => @human_name.name, :origin_language_id => @human_name.origin_language_id }
    end

    assert_redirected_to human_name_path(assigns(:human_name))
  end

  test "should show human_name" do
    get :show, :id => @human_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @human_name
    assert_response :success
  end

  test "should update human_name" do
    put :update, :id => @human_name, :human_name => { :description => @human_name.description, :gender => @human_name.gender, :is_forbidden => @human_name.is_forbidden, :is_natural => @human_name.is_natural, :name => @human_name.name, :origin_language_id => @human_name.origin_language_id }
    assert_redirected_to human_name_path(assigns(:human_name))
  end

  test "should destroy human_name" do
    assert_difference('HumanName.count', -1) do
      delete :destroy, :id => @human_name
    end

    assert_redirected_to human_names_path
  end
end
