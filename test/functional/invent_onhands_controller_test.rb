require 'test_helper'

class InventOnhandsControllerTest < ActionController::TestCase
  setup do
    @invent_onhand = invent_onhands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invent_onhands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invent_onhand" do
    assert_difference('InventOnhand.count') do
      post :create, invent_onhand: { invent_item_id: @invent_onhand.invent_item_id, invent_location_id: @invent_onhand.invent_location_id, on_order_qty: @invent_onhand.on_order_qty, ordered_qty: @invent_onhand.ordered_qty, physical_qty: @invent_onhand.physical_qty, posted_qty: @invent_onhand.posted_qty }
    end

    assert_redirected_to invent_onhand_path(assigns(:invent_onhand))
  end

  test "should show invent_onhand" do
    get :show, id: @invent_onhand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invent_onhand
    assert_response :success
  end

  test "should update invent_onhand" do
    put :update, id: @invent_onhand, invent_onhand: { invent_item_id: @invent_onhand.invent_item_id, invent_location_id: @invent_onhand.invent_location_id, on_order_qty: @invent_onhand.on_order_qty, ordered_qty: @invent_onhand.ordered_qty, physical_qty: @invent_onhand.physical_qty, posted_qty: @invent_onhand.posted_qty }
    assert_redirected_to invent_onhand_path(assigns(:invent_onhand))
  end

  test "should destroy invent_onhand" do
    assert_difference('InventOnhand.count', -1) do
      delete :destroy, id: @invent_onhand
    end

    assert_redirected_to invent_onhands_path
  end
end
