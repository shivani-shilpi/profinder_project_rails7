class PhysiciansController < ApplicationController
  before_action :set_physician, only: %i[ show edit update destroy ]

  def index
    @physicians = Physician.all
  end

  def show
    @physician_decorator = helpers.decorate(@physician)
    @abc = FullName.new(@physician).to_s
  end

  def new
    @physician = Physician.new
  end

  def edit
  end

  def create
    @physician = Physician.new(physician_params)

    # pationt_to_add = params[:physician][:pationt_ids]

    # pationt_to_add.each do |pationt_id|
    #   if pationt_id != ""
    #     pationt_id = pationt_id.to_i
    #     pationt_to_add = Pationt.find_by_id(pationt_id)
    #     @physician.pationts << pationt_to_add
    #   end
    # end

    respond_to do |format|
      if @physician.save
        format.html { redirect_to physician_url(@physician), notice: "Physician was successfully created." }
        format.json { render :show, status: :created, location: @physician }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @physician.update(physician_params)
        format.html { redirect_to physician_url(@physician), notice: "Physician was successfully updated." }
        format.json { render :show, status: :ok, location: @physician }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @physician.destroy

    respond_to do |format|
      format.html { redirect_to physicians_url, notice: "Physician was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_physician
      @physician = Physician.find(params[:id])
    end

    def physician_params
      params.require(:physician).permit(:name, :last_name, pationt_ids: [])
    end
end
