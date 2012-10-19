require 'test_helper'

class PurchLinesControllerTest < ActionController::TestCase
  setup do
    @purch_line = purch_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purch_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purch_line" do
    assert_difference('PurchLine.count') do
      post :create, purch_line: { dimension_id: @purch_line.dimension_id, item_id: @purch_line.item_id, purch_id: @purch_line.purch_id, qty: @purch_line.qty, type: @purch_line.type }
    end

    assert_redirected_to purch_line_path(assigns(:purch_line))
  end

  test "should show purch_line" do
    get :show, id: @purch_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purch_line
    assert_response :success
  end

  test "should update purch_line" do
    put :update, id: @purch_line, purch_line: { dimension_id: @purch_line.dimension_id, item_id: @purch_line.item_id, purch_id: @purch_line.purch_id, qty: @purch_line.qty, type: @purch_line.type }
    assert_redirected_to purch_line_path(assigns(:purch_line))
  end

  test "should destroy purch_line" do
    assert_difference('PurchLine.count', -1) do
      delete :destroy, id: @purch_line
    end

    assert_redirected_to purch_lines_path
  end
end
