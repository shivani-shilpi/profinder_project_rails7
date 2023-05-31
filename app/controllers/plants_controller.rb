class PlantsController < ApplicationController
  before_action :set_plant, only: %i[ show edit update destroy]

  def index
    @plants = Plant.all.order(position: :asc)
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def edit
  end

  def create
    @plant = Plant.new(plant_params)
 
    respond_to do |format|
      if @plant.save
        format.html { redirect_to plant_url(@plant), notice: "Plant was successfully created." }
        format.json { render :show, status: :created, location: @plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  def plant_pdf
		flash[:notice] = "Please wait, we will mail the PDF on your email"
    # PlantsPdfWorker.perform_at(@plant)
    file = WickedPdf.new.pdf_from_string(render_to_string(template: 'plants/plant_pdf'))
    send_data(file, filename: "file.pdf", type: 'application/pdf')
  end

  def plant_csv
		csv_method_result,csv_location = @course.generate_csv_report
		if csv_method_result==1
			send_file csv_location, :type => "application/csv"
		else
			flash[:alert] ="Team not found or there are no responses."
			redirect_to plants_path
		end
  end

  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to plant_url(@plant), notice: "Plant was successfully updated." }
        format.json { render :show, status: :ok, location: @plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plant.destroy

    respond_to do |format|
      format.html { redirect_to plants_url, notice: "Plant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_plant
      @plant = Plant.find(params[:id])
    end

    def plant_params
      params.require(:plant).permit(:name, :price, :image)
    end
end
