require 'test_helper'

class PurchesControllerTest < ActionController::TestCase
  setup do
    @purch = purches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purch" do
    assert_difference('Purch.count') do
      post :create, purch: { description: @purch.description, dimension_id: @purch.dimension_id, number: @purch.number, type: @purch.type }
    end

    assert_redirected_to purch_path(assigns(:purch))
  end

  test "should show purch" do
    get :show, id: @purch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purch
    assert_response :success
  end

  test "should update purch" do
    put :update, id: @purch, purch: { description: @purch.description, dimension_id: @purch.dimension_id, number: @purch.number, type: @purch.type }
    assert_redirected_to purch_path(assigns(:purch))
  end

  test "should destroy purch" do
    assert_difference('Purch.count', -1) do
      delete :destroy, id: @purch
    end

    assert_redirected_to purches_path
  end
end
