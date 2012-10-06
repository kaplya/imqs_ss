require 'test_helper'

class InventTransactionsControllerTest < ActionController::TestCase
  setup do
    @invent_transaction = invent_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invent_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invent_transaction" do
    assert_difference('InventTransaction.count') do
      post :create, invent_transaction: { invent_item_id: @invent_transaction.invent_item_id, invent_location_id: @invent_transaction.invent_location_id, qty: @invent_transaction.qty, status_issue: @invent_transaction.status_issue, status_receipt: @invent_transaction.status_receipt }
    end

    assert_redirected_to invent_transaction_path(assigns(:invent_transaction))
  end

  test "should show invent_transaction" do
    get :show, id: @invent_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invent_transaction
    assert_response :success
  end

  test "should update invent_transaction" do
    put :update, id: @invent_transaction, invent_transaction: { invent_item_id: @invent_transaction.invent_item_id, invent_location_id: @invent_transaction.invent_location_id, qty: @invent_transaction.qty, status_issue: @invent_transaction.status_issue, status_receipt: @invent_transaction.status_receipt }
    assert_redirected_to invent_transaction_path(assigns(:invent_transaction))
  end

  test "should destroy invent_transaction" do
    assert_difference('InventTransaction.count', -1) do
      delete :destroy, id: @invent_transaction
    end

    assert_redirected_to invent_transactions_path
  end
end
