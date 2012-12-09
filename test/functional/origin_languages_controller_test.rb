require 'test_helper'

class OriginLanguagesControllerTest < ActionController::TestCase
  setup do
    @origin_language = origin_languages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:origin_languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create origin_language" do
    assert_difference('OriginLanguage.count') do
      post :create, :origin_language => { :name => @origin_language.name }
    end

    assert_redirected_to origin_language_path(assigns(:origin_language))
  end

  test "should show origin_language" do
    get :show, :id => @origin_language
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @origin_language
    assert_response :success
  end

  test "should update origin_language" do
    put :update, :id => @origin_language, :origin_language => { :name => @origin_language.name }
    assert_redirected_to origin_language_path(assigns(:origin_language))
  end

  test "should destroy origin_language" do
    assert_difference('OriginLanguage.count', -1) do
      delete :destroy, :id => @origin_language
    end

    assert_redirected_to origin_languages_path
  end
end
