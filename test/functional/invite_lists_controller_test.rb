require 'test_helper'

class InviteListsControllerTest < ActionController::TestCase
  setup do
    @invite_list = invite_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invite_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invite_list" do
    assert_difference('InviteList.count') do
      post :create, invite_list: { invited: @invite_list.invited }
    end

    assert_redirected_to invite_list_path(assigns(:invite_list))
  end

  test "should show invite_list" do
    get :show, id: @invite_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invite_list
    assert_response :success
  end

  test "should update invite_list" do
    put :update, id: @invite_list, invite_list: { invited: @invite_list.invited }
    assert_redirected_to invite_list_path(assigns(:invite_list))
  end

  test "should destroy invite_list" do
    assert_difference('InviteList.count', -1) do
      delete :destroy, id: @invite_list
    end

    assert_redirected_to invite_lists_path
  end
end
