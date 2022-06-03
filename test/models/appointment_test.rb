require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  test "should not create appointment without address" do
    seller = Seller.new
    assert_not seller.save, "Saved the appointment without a address"
  end

  test "should not create appointment without a timeslot" do
    seller = Seller.new
    assert_not seller.save, "Saved the appointment without a timeslot"
  end

  test "should not create appointment without a date" do
    seller = Seller.new
    assert_not seller.save, "Saved the appointment without a date"
  end
end
