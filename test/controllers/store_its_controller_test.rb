require 'test_helper'

class StoreItsControllerTest < ActionController::TestCase
  setup do
    @store_it = store_its(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_its)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_it" do
    assert_difference('StoreIt.count') do
      post :create, store_it: { email: @store_it.email, name: @store_it.name, password_digest: @store_it.password_digest }
    end

    assert_redirected_to store_it_path(assigns(:store_it))
  end

  test "should show store_it" do
    get :show, id: @store_it
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_it
    assert_response :success
  end

  test "should update store_it" do
    patch :update, id: @store_it, store_it: { email: @store_it.email, name: @store_it.name, password_digest: @store_it.password_digest }
    assert_redirected_to store_it_path(assigns(:store_it))
  end

  test "should destroy store_it" do
    assert_difference('StoreIt.count', -1) do
      delete :destroy, id: @store_it
    end

    assert_redirected_to store_its_path
  end
end
