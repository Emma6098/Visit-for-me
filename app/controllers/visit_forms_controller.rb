class VisitFormsController < ApplicationController
  def index
    @visit_forms = VisitForm.all
  end

  def show
    @visit_form = VisitForm.find(params[:id])
    @criteres = Critere.all
    @criteres = @visit_form.criteres
    @booking = Booking.new
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
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @visit_form = VisitForm.find(params[:id])
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
    params.require(:visit_form).permit(:title, :address, :longitude, :latitude, :description, :url, :date, :rooms_number, :criteres)
  end
end
