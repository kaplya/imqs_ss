require 'test_helper'

class PackingSlipsControllerTest < ActionController::TestCase
  setup do
    @packing_slip = packing_slips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packing_slips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packing_slip" do
    assert_difference('PackingSlip.count') do
      post :create, packing_slip: { description: @packing_slip.description, number: @packing_slip.number, purch_id: @packing_slip.purch_id, type: @packing_slip.type }
    end

    assert_redirected_to packing_slip_path(assigns(:packing_slip))
  end

  test "should show packing_slip" do
    get :show, id: @packing_slip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packing_slip
    assert_response :success
  end

  test "should update packing_slip" do
    put :update, id: @packing_slip, packing_slip: { description: @packing_slip.description, number: @packing_slip.number, purch_id: @packing_slip.purch_id, type: @packing_slip.type }
    assert_redirected_to packing_slip_path(assigns(:packing_slip))
  end

  test "should destroy packing_slip" do
    assert_difference('PackingSlip.count', -1) do
      delete :destroy, id: @packing_slip
    end

    assert_redirected_to packing_slips_path
  end
end
