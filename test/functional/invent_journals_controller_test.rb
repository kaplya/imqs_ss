require 'test_helper'

class InventJournalsControllerTest < ActionController::TestCase
  setup do
    @invent_journal = invent_journals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invent_journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invent_journal" do
    assert_difference('InventJournal.count') do
      post :create, invent_journal: { description: @invent_journal.description, location_id: @invent_journal.location_id, number: @invent_journal.number, to_location_id: @invent_journal.to_location_id, type: @invent_journal.type }
    end

    assert_redirected_to invent_journal_path(assigns(:invent_journal))
  end

  test "should show invent_journal" do
    get :show, id: @invent_journal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invent_journal
    assert_response :success
  end

  test "should update invent_journal" do
    put :update, id: @invent_journal, invent_journal: { description: @invent_journal.description, location_id: @invent_journal.location_id, number: @invent_journal.number, to_location_id: @invent_journal.to_location_id, type: @invent_journal.type }
    assert_redirected_to invent_journal_path(assigns(:invent_journal))
  end

  test "should destroy invent_journal" do
    assert_difference('InventJournal.count', -1) do
      delete :destroy, id: @invent_journal
    end

    assert_redirected_to invent_journals_path
  end
end
