class BookingsController < ApplicationController
  before_action :set_visit_form, only: %i[create]

  def create
    @booking = Booking.new
    @booking.visit_form = @visit_form

    @booking.user = current_user
    @booking.statut = "en attente de validation"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking_delete = Booking.find(params[:id])
    @booking_delete.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def set_visit_form
    @visit_form = VisitForm.find(params[:visit_form_id])
  end
end
