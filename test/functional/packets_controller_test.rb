require 'test_helper'

class PacketsControllerTest < ActionController::TestCase
  setup do
    @packet = packets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packet" do
    assert_difference('Packet.count') do
      post :create, packet: { name: @packet.name }
    end

    assert_redirected_to packet_path(assigns(:packet))
  end

  test "should show packet" do
    get :show, id: @packet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packet
    assert_response :success
  end

  test "should update packet" do
    put :update, id: @packet, packet: { name: @packet.name }
    assert_redirected_to packet_path(assigns(:packet))
  end

  test "should destroy packet" do
    assert_difference('Packet.count', -1) do
      delete :destroy, id: @packet
    end

    assert_redirected_to packets_path
  end
end
