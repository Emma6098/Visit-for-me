class VisitFormsController < ApplicationController
  def index
    if params[:keyword]
      @visit_forms = VisitForm.search_by_address(params[:keyword])
    else
      @visit_forms = VisitForm.all
    end

    @markers = @visit_forms.geocoded.map do |visit_form|
      {
        lat: visit_form.latitude,
        lng: visit_form.longitude
      }
    end
  end

  def show
    @visit_form = VisitForm.find(params[:id])
    @criteres = Critere.all
    @criteres = @visit_form.criteres
    @booking = Booking.new
    @rooms = Room.new
    @marker = {
      lat: @visit_form.latitude,
      lng: @visit_form.longitude
      }
  end

  def new
    @visit_form = VisitForm.new
    @visit_form.criteres.build
  end

  def create
    @visit_form = VisitForm.new(visit_form_params)
    @visit_form.user = current_user
    @visit_form.rooms_number.times do |room|
      Room.create(visit_form: @visit_form)
    end
    if @visit_form.save
      redirect_to @visit_form
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @visit_form = VisitForm.find(params[:id])
    @rooms = Room.all
    @bookings = Booking.all
    @visit_form_user = @visit_form.user
  end

  def update
    @visit_form = VisitForm.find(params[:id])
    @visit_form.update(visit_form_params)
    redirect_to visit_form_path(@visit_form)
  end

  def destroy
    @visit_form = VisitForm.find(params[:id])
    @visit_form.destroy
    redirect_to visit_forms_path(@visit_form), status: :see_other
  end

  private

  def visit_form_params
    params.require(:visit_form).permit(:title, :address, :longitude, :latitude, :description, :url, :date, :rooms_number, criteres_attributes: [:id, :question, :answer, :_destroy], rooms_attributes: [:id, :description, :name])
  end
end
