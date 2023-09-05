class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def control
  end

  def accept
    @booking_accept = Booking.find(params[:booking_id])

    @booking_accept.update!(status: "validé")
    other_user = @booking_accept.user

    # @visit_form = VisitForm.find(params[:id])
    @chatroom = Chatroom.create!(name: "Chat avec #{other_user.first_name}", user_id: current_user.id, other_user_id: other_user.id)
    redirect_to control_path
  end

  def reject
    @booking_reject = Booking.find(params[:booking_id])
    @booking_reject.update!(status: "rejetée")
    redirect_to control_path
  end

  def ended
    @booking_ended = Booking.find(params[:booking_id])
    @booking_ended.update!(status: "terminée")
    redirect_to control_path
  end
end
