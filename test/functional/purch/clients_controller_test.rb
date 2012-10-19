require 'test_helper'

class Purch::ClientsControllerTest < ActionController::TestCase
  setup do
    @purch_client = purch_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purch_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purch_client" do
    assert_difference('Purch::Client.count') do
      post :create, purch_client: { name: @purch_client.name }
    end

    assert_redirected_to purch_client_path(assigns(:purch_client))
  end

  test "should show purch_client" do
    get :show, id: @purch_client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purch_client
    assert_response :success
  end

  test "should update purch_client" do
    put :update, id: @purch_client, purch_client: { name: @purch_client.name }
    assert_redirected_to purch_client_path(assigns(:purch_client))
  end

  test "should destroy purch_client" do
    assert_difference('Purch::Client.count', -1) do
      delete :destroy, id: @purch_client
    end

    assert_redirected_to purch_clients_path
  end
end
