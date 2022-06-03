require "test_helper"

class SellersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seller = sellers(:one)
  end

  test 'can create a seller' do
    assert_difference('Seller.count') do
      post sellers_url, params: { seller: { name: 'test name', phone: 'test number' } }
    end

    assert_redirected_to seller_url(Seller.last)
  end

  test 'cannot create a seller with invalid attributes' do
    assert_no_difference('Seller.count') do
      post sellers_url, params: { seller: { name: 'test name', phone: '' } }
    end
  end

  test 'can view seller' do
    get seller_url(@seller)
    assert_response :success
  end
end
