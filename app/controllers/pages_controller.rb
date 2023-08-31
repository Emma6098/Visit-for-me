class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def control
  end

  def accept
    @booking_accept = Booking.find(params[:booking_id])
    @booking_accept.update!(status: "validé")
    redirect_to control_path
  end

  def reject
    @booking_reject = Booking.find(params[:booking_id])
    @booking_reject.update!(status: "rejeté")
    redirect_to control_path
  end
end
