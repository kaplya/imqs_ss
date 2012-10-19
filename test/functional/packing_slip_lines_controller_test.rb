require 'test_helper'

class PackingSlipLinesControllerTest < ActionController::TestCase
  setup do
    @packing_slip_line = packing_slip_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packing_slip_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packing_slip_line" do
    assert_difference('PackingSlipLine.count') do
      post :create, packing_slip_line: { amount: @packing_slip_line.amount, dimension_id: @packing_slip_line.dimension_id, item_id: @packing_slip_line.item_id, price: @packing_slip_line.price, qty: @packing_slip_line.qty, slip_id: @packing_slip_line.slip_id, type: @packing_slip_line.type }
    end

    assert_redirected_to packing_slip_line_path(assigns(:packing_slip_line))
  end

  test "should show packing_slip_line" do
    get :show, id: @packing_slip_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packing_slip_line
    assert_response :success
  end

  test "should update packing_slip_line" do
    put :update, id: @packing_slip_line, packing_slip_line: { amount: @packing_slip_line.amount, dimension_id: @packing_slip_line.dimension_id, item_id: @packing_slip_line.item_id, price: @packing_slip_line.price, qty: @packing_slip_line.qty, slip_id: @packing_slip_line.slip_id, type: @packing_slip_line.type }
    assert_redirected_to packing_slip_line_path(assigns(:packing_slip_line))
  end

  test "should destroy packing_slip_line" do
    assert_difference('PackingSlipLine.count', -1) do
      delete :destroy, id: @packing_slip_line
    end

    assert_redirected_to packing_slip_lines_path
  end
end
