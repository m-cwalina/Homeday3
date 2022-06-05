class AppointmentsController < ApplicationController
  def new
    @seller = Seller.find(params[:seller_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @seller = Seller.find(params[:seller_id])
    @appointment.seller = @seller
    @appointment.save
    @realtor = Realtor.within(20, :units => :kms, :origin => [@appointment.latitude, @appointment.longitude]).first
    @appointment.realtor = @realtor
    if @appointment.save
      redirect_to seller_appointment_path(@appointment, @seller), notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:seller_id])
  end

  def past
    @past_appointments = Realtor.find(params[:realtor_id]).appointments.where(:date => 1.month.ago.beginning_of_month..1.month.ago.end_of_month).order(:date)
  end

  def future
    @realtor_appointment = Realtor.find(params[:realtor_id])
    @future_appointments = Realtor.find(params[:realtor_id]).appointments.where(:date  => Time.now.beginning_of_month + 1.month..Time.now.beginning_of_month + 2.month - 1.day).by_distance(:origin => [@realtor_appointment.latitude, @realtor_appointment.longitude])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:address, :timeslot, :date)
  end
end
