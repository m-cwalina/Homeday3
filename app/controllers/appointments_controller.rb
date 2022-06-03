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
    @realtor = Realtor.find(params[:realtor_id])
  end

  def future
    @realtor = Realtor.find(params[:realtor_id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:address, :timeslot, :date)
  end
end
