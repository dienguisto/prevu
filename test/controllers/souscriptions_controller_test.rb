require 'test_helper'

class SouscriptionsControllerTest < ActionController::TestCase
  setup do
    @souscription = souscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:souscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create souscription" do
    assert_difference('Souscription.count') do
      post :create, souscription: { actif: @souscription.actif, actif: @souscription.actif, adherent_id: @souscription.adherent_id, date_activation: @souscription.date_activation, date_expiration: @souscription.date_expiration, date_paiement: @souscription.date_paiement, formule_id: @souscription.formule_id, paye: @souscription.paye }
    end

    assert_redirected_to souscription_path(assigns(:souscription))
  end

  test "should show souscription" do
    get :show, id: @souscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @souscription
    assert_response :success
  end

  test "should update souscription" do
    patch :update, id: @souscription, souscription: { actif: @souscription.actif, actif: @souscription.actif, adherent_id: @souscription.adherent_id, date_activation: @souscription.date_activation, date_expiration: @souscription.date_expiration, date_paiement: @souscription.date_paiement, formule_id: @souscription.formule_id, paye: @souscription.paye }
    assert_redirected_to souscription_path(assigns(:souscription))
  end

  test "should destroy souscription" do
    assert_difference('Souscription.count', -1) do
      delete :destroy, id: @souscription
    end

    assert_redirected_to souscriptions_path
  end
end
