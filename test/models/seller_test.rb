require "test_helper"

class SellerTest < ActiveSupport::TestCase
  test "should not save seller without name" do
    seller = Seller.new
    assert_not seller.save, "Saved the article without a title"
  end
end
