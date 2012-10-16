require 'test_helper'

class InventDimensionsControllerTest < ActionController::TestCase
  setup do
    @invent_dimension = invent_dimensions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invent_dimensions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invent_dimension" do
    assert_difference('InventDimension.count') do
      post :create, invent_dimension: { batch_id: @invent_dimension.batch_id, color_id: @invent_dimension.color_id, location_id: @invent_dimension.location_id, size_id: @invent_dimension.size_id }
    end

    assert_redirected_to invent_dimension_path(assigns(:invent_dimension))
  end

  test "should show invent_dimension" do
    get :show, id: @invent_dimension
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invent_dimension
    assert_response :success
  end

  test "should update invent_dimension" do
    put :update, id: @invent_dimension, invent_dimension: { batch_id: @invent_dimension.batch_id, color_id: @invent_dimension.color_id, location_id: @invent_dimension.location_id, size_id: @invent_dimension.size_id }
    assert_redirected_to invent_dimension_path(assigns(:invent_dimension))
  end

  test "should destroy invent_dimension" do
    assert_difference('InventDimension.count', -1) do
      delete :destroy, id: @invent_dimension
    end

    assert_redirected_to invent_dimensions_path
  end
end
