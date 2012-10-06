require 'test_helper'

class InventJournalLinesControllerTest < ActionController::TestCase
  setup do
    @invent_journal_line = invent_journal_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invent_journal_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invent_journal_line" do
    assert_difference('InventJournalLine.count') do
      post :create, invent_journal_line: { invent_item_id: @invent_journal_line.invent_item_id, invent_journal_id: @invent_journal_line.invent_journal_id, journal_number: @invent_journal_line.journal_number, qty: @invent_journal_line.qty }
    end

    assert_redirected_to invent_journal_line_path(assigns(:invent_journal_line))
  end

  test "should show invent_journal_line" do
    get :show, id: @invent_journal_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invent_journal_line
    assert_response :success
  end

  test "should update invent_journal_line" do
    put :update, id: @invent_journal_line, invent_journal_line: { invent_item_id: @invent_journal_line.invent_item_id, invent_journal_id: @invent_journal_line.invent_journal_id, journal_number: @invent_journal_line.journal_number, qty: @invent_journal_line.qty }
    assert_redirected_to invent_journal_line_path(assigns(:invent_journal_line))
  end

  test "should destroy invent_journal_line" do
    assert_difference('InventJournalLine.count', -1) do
      delete :destroy, id: @invent_journal_line
    end

    assert_redirected_to invent_journal_lines_path
  end
end
