require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seller = sellers(:one)
    @appointment = appointments(:one)
  end

  test 'can create an appointment' do
    assert_difference('Appointment.count') do
      post seller_appointments_url(@seller), params: { appointment: {longitude: 'test longitude', latitude: 'test latitude', address: 'test address', timeslot: 'test timeslot' }, seller_id: @seller }
    end
  end

  test 'can view appointment' do
    get seller_appointment_url(@appointment, @seller)
    assert_response :success
  end
end
