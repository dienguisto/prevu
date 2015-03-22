require 'test_helper'

class FormulesControllerTest < ActionController::TestCase
  setup do
    @formule = formules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formule" do
    assert_difference('Formule.count') do
      post :create, formule: { montant_adhesion: @formule.montant_adhesion, montant_cotisation: @formule.montant_cotisation, nom: @formule.nom, occurrence_periode: @formule.occurrence_periode, periode: @formule.periode }
    end

    assert_redirected_to formule_path(assigns(:formule))
  end

  test "should show formule" do
    get :show, id: @formule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formule
    assert_response :success
  end

  test "should update formule" do
    patch :update, id: @formule, formule: { montant_adhesion: @formule.montant_adhesion, montant_cotisation: @formule.montant_cotisation, nom: @formule.nom, occurrence_periode: @formule.occurrence_periode, periode: @formule.periode }
    assert_redirected_to formule_path(assigns(:formule))
  end

  test "should destroy formule" do
    assert_difference('Formule.count', -1) do
      delete :destroy, id: @formule
    end

    assert_redirected_to formules_path
  end
end
