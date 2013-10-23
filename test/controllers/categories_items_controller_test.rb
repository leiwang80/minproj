require 'test_helper'

class CategoriesItemsControllerTest < ActionController::TestCase
  setup do
    @categories_item = categories_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categories_item" do
    assert_difference('CategoriesItem.count') do
      post :create, categories_item: { category_id: @categories_item.category_id, item_id: @categories_item.item_id }
    end

    assert_redirected_to categories_item_path(assigns(:categories_item))
  end

  test "should show categories_item" do
    get :show, id: @categories_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categories_item
    assert_response :success
  end

  test "should update categories_item" do
    patch :update, id: @categories_item, categories_item: { category_id: @categories_item.category_id, item_id: @categories_item.item_id }
    assert_redirected_to categories_item_path(assigns(:categories_item))
  end

  test "should destroy categories_item" do
    assert_difference('CategoriesItem.count', -1) do
      delete :destroy, id: @categories_item
    end

    assert_redirected_to categories_items_path
  end
end
