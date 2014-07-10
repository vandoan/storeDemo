require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success

    assert_select ' .entry' , 2
    assert_select 'h1', 'Catalog'
    assert_select '.price' , /\$[,\d]+\.\d\d/

  end


test "markup needed for store.js.coffee is in place" do  
	get :index
	assert_select '.store .entry > img' , 3
	assert_select '.entry input[type=submit]' , 3
end 


end
