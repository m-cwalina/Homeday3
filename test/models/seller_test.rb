require "test_helper"

class SellerTest < ActiveSupport::TestCase
  test "should not save seller without name" do
    seller = Seller.new
    assert_not seller.save, "Saved the seller without a name"
  end

  test "should not save seller without a phone number" do
    seller = Seller.new
    assert_not seller.save, "Saved the seller without a phone number"
  end
end
