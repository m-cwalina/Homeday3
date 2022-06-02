class AppointmentsController < ApplicationController
  def new
    @seller = Seller.find(params[:seller_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @seller = Seller.find(params[:seller_id])
    @appointment.seller = @seller
    debugger
    @appointment.save
    @realtor = Realtor.within(20, :units => :kms, :origin => [@appointment.latitude, @appointment.longitude]).first
    @appointment.realtor = @realtor
    if @appointment.save
      redirect_to appointment_path(@appointment), notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:address, :timeslot, :date)
  end
end
