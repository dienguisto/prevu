require 'test_helper'

class VersementsControllerTest < ActionController::TestCase
  setup do
    @versement = versements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:versements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create versement" do
    assert_difference('Versement.count') do
      post :create, versement: { compte_id: @versement.compte_id, mandataire_id: @versement.mandataire_id, montant: @versement.montant }
    end

    assert_redirected_to versement_path(assigns(:versement))
  end

  test "should show versement" do
    get :show, id: @versement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @versement
    assert_response :success
  end

  test "should update versement" do
    patch :update, id: @versement, versement: { compte_id: @versement.compte_id, mandataire_id: @versement.mandataire_id, montant: @versement.montant }
    assert_redirected_to versement_path(assigns(:versement))
  end

  test "should destroy versement" do
    assert_difference('Versement.count', -1) do
      delete :destroy, id: @versement
    end

    assert_redirected_to versements_path
  end
end
