require 'test_helper'

class StructureAperitricesControllerTest < ActionController::TestCase
  setup do
    @structure_aperitrice = structure_aperitrices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:structure_aperitrices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create structure_aperitrice" do
    assert_difference('StructureAperitrice.count') do
      post :create, structure_aperitrice: { adresse: @structure_aperitrice.adresse, date_adhesion: @structure_aperitrice.date_adhesion, nom: @structure_aperitrice.nom }
    end

    assert_redirected_to structure_aperitrice_path(assigns(:structure_aperitrice))
  end

  test "should show structure_aperitrice" do
    get :show, id: @structure_aperitrice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @structure_aperitrice
    assert_response :success
  end

  test "should update structure_aperitrice" do
    patch :update, id: @structure_aperitrice, structure_aperitrice: { adresse: @structure_aperitrice.adresse, date_adhesion: @structure_aperitrice.date_adhesion, nom: @structure_aperitrice.nom }
    assert_redirected_to structure_aperitrice_path(assigns(:structure_aperitrice))
  end

  test "should destroy structure_aperitrice" do
    assert_difference('StructureAperitrice.count', -1) do
      delete :destroy, id: @structure_aperitrice
    end

    assert_redirected_to structure_aperitrices_path
  end
end
