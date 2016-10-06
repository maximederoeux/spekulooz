require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu = menus(:one)
  end

  test "should get index" do
    get menus_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_url
    assert_response :success
  end

  test "should create menu" do
    assert_difference('Menu.count') do
      post menus_url, params: { menu: { account_id: @menu.account_id, active: @menu.active, description: @menu.description, drink: @menu.drink, end_date: @menu.end_date, food: @menu.food, name: @menu.name, period: @menu.period, period_quantity: @menu.period_quantity, price: @menu.price, promote: @menu.promote, start_date: @menu.start_date, status: @menu.status } }
    end

    assert_redirected_to menu_url(Menu.last)
  end

  test "should show menu" do
    get menu_url(@menu)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_url(@menu)
    assert_response :success
  end

  test "should update menu" do
    patch menu_url(@menu), params: { menu: { account_id: @menu.account_id, active: @menu.active, description: @menu.description, drink: @menu.drink, end_date: @menu.end_date, food: @menu.food, name: @menu.name, period: @menu.period, period_quantity: @menu.period_quantity, price: @menu.price, promote: @menu.promote, start_date: @menu.start_date, status: @menu.status } }
    assert_redirected_to menu_url(@menu)
  end

  test "should destroy menu" do
    assert_difference('Menu.count', -1) do
      delete menu_url(@menu)
    end

    assert_redirected_to menus_url
  end
end
