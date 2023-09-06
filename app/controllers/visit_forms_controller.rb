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
        lng: visit_form.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {visit_form: visit_form})
      }
    end
  end

  def show
    @visit_form = VisitForm.find(params[:id])
    @criteres = Critere.all
    @rooms = Room.all
    @criteres = @visit_form.criteres
    @rooms = @visit_form.rooms
    @booking = Booking.new
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

    if @visit_form.save
      redirect_to @visit_form
      @visit_form.create_rooms
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

    if params[:rooms_names].present?
      params[:rooms_names].each do |room_params|
        room_id = room_params[0]
        room_name = room_params[1]
        r = Room.find(room_id)
        r.update(name: room_name)
        r.save!
      end
    end

    if params[:rooms_descriptions].present?
      params[:rooms_descriptions].each do |room_params|
        room_id = room_params[0]
        room_description = room_params[1]
        r = Room.find(room_id)
        r.update(description: room_description)
        r.save!
      end
    end

    if params[:rooms_photos].present?
      params[:rooms_photos].each do |room_params|
        room_id = room_params[0]
        room_photos = room_params[1]
        r = Room.find(room_id)
        r.update(photos: room_photos)
        r.save!
      end
    end
    if @visit_form.save
      redirect_to visit_form_path(@visit_form)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @visit_form = VisitForm.find(params[:id])
    @visit_form.destroy
    redirect_to visit_forms_path(@visit_form), status: :see_other
  end

  private

  def visit_form_params
    params.require(:visit_form).permit(:title, :address, :longitude, :latitude, :description, :url, :date, :rooms_number, criteres_attributes: [:id, :question, :answer, :_destroy, :photos], rooms_attributes: [:id, :description, :name, :photos])
  end
end
