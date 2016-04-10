require 'test_helper'

class ReservationTypesControllerTest < ActionController::TestCase
  setup do
    @reservation_type = reservation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation_type" do
    assert_difference('ReservationType.count') do
      post :create, reservation_type: { description: @reservation_type.description, name: @reservation_type.name }
    end

    assert_redirected_to reservation_type_path(assigns(:reservation_type))
  end

  test "should show reservation_type" do
    get :show, id: @reservation_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation_type
    assert_response :success
  end

  test "should update reservation_type" do
    patch :update, id: @reservation_type, reservation_type: { description: @reservation_type.description, name: @reservation_type.name }
    assert_redirected_to reservation_type_path(assigns(:reservation_type))
  end

  test "should destroy reservation_type" do
    assert_difference('ReservationType.count', -1) do
      delete :destroy, id: @reservation_type
    end

    assert_redirected_to reservation_types_path
  end
end
