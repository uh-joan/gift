require 'test_helper'

class GiftsControllerTest < ActionController::TestCase
  setup do
    @gift = gifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gift" do
    assert_difference('Gift.count') do
      post :create, gift: { completed: @gift.completed, delivery: @gift.delivery, expiry: @gift.expiry, fullDescription: @gift.fullDescription, higherAmount: @gift.higherAmount, lowerAmount: @gift.lowerAmount, note: @gift.note, redeem: @gift.redeem, shortDescription: @gift.shortDescription, title: @gift.title }
    end

    assert_redirected_to gift_path(assigns(:gift))
  end

  test "should show gift" do
    get :show, id: @gift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gift
    assert_response :success
  end

  test "should update gift" do
    patch :update, id: @gift, gift: { completed: @gift.completed, delivery: @gift.delivery, expiry: @gift.expiry, fullDescription: @gift.fullDescription, higherAmount: @gift.higherAmount, lowerAmount: @gift.lowerAmount, note: @gift.note, redeem: @gift.redeem, shortDescription: @gift.shortDescription, title: @gift.title }
    assert_redirected_to gift_path(assigns(:gift))
  end

  test "should destroy gift" do
    assert_difference('Gift.count', -1) do
      delete :destroy, id: @gift
    end

    assert_redirected_to gifts_path
  end
end
