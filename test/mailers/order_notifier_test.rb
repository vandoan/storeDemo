require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Specimen Store Order Confirmation" , mail.subject
    assert_equal [ "dave@example.org"], mail.to 
    assert_equal ["depot@example.com"], mail.from 
    assert_match /1 X Rare Pig/, mail.body.encoded
  end 
  test "shipped" do 
    mail = OrderNotifier.shipped(orders(one))

    assert_equal "Specimen Store Order Shipped" , mail.subject      
    assert_equal ["depot@example.com"], mail.to 
    assert_equal ["depot@example.com"], mail.from 
    assert_match /<td>1&times;<\/td>\s*<td> Rare Pig<\/td>/, 
    mail.body.encoded
  
  end

end
