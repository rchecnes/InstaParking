require 'test_helper'

class CarParksControllerTest < ActionController::TestCase
  setup do
    @car_park = car_parks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:car_parks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car_park" do
    assert_difference('CarPark.count') do
      post :create, car_park: { address: @car_park.address, description: @car_park.description, district_id: @car_park.district_id, ended_at: @car_park.ended_at, ended_time: @car_park.ended_time, price: @car_park.price, started_at: @car_park.started_at, started_time: @car_park.started_time, state: @car_park.state, url_image: @car_park.url_image, user_id: @car_park.user_id }
    end

    assert_redirected_to car_park_path(assigns(:car_park))
  end

  test "should show car_park" do
    get :show, id: @car_park
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @car_park
    assert_response :success
  end

  test "should update car_park" do
    patch :update, id: @car_park, car_park: { address: @car_park.address, description: @car_park.description, district_id: @car_park.district_id, ended_at: @car_park.ended_at, ended_time: @car_park.ended_time, price: @car_park.price, started_at: @car_park.started_at, started_time: @car_park.started_time, state: @car_park.state, url_image: @car_park.url_image, user_id: @car_park.user_id }
    assert_redirected_to car_park_path(assigns(:car_park))
  end

  test "should destroy car_park" do
    assert_difference('CarPark.count', -1) do
      delete :destroy, id: @car_park
    end

    assert_redirected_to car_parks_path
  end
end
