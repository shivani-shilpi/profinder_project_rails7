class PationtsController < ApplicationController
  before_action :set_pationt, only: %i[ show edit update destroy ]

  def index
    @pationts = Pationt.all
  end

  def show
  end

  def new
    @pationt = Pationt.new
    @pationt.physicians.build
    @pationt.appointments.build
  end

  def edit
  end

  def create
    @pationt = PationtForm.new(pationt_params)
      if @pationt.persist
        redirect_to pationt_url(@pationt.record), notice: "Pationt was successfully created." 
      else
        render :new
      end
  end

  def update
    respond_to do |format|
      if @pationt.update(pationt_params)
        format.html { redirect_to pationt_url(@pationt), notice: "Pationt was successfully updated." }
        format.json { render :show, status: :ok, location: @pationt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pationt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pationt.destroy
    respond_to do |format|
      format.html { redirect_to pationts_url, notice: "Pationt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_pationt
      @pationt = Pationt.find(params[:id])
    end

    def pationt_params
      params.require(:pationt).permit(:name, :last_name)
      # params.require(:pationt).permit(:name, :last_name, physicians_attributes: [:physician_id, :name])
    end
end
