require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success

    assert_select ' .entry' , 2
    assert_select 'h1', 'Catalog'
    assert_select '.price' , /\$[,\d]+\.\d\d/

  end

end
