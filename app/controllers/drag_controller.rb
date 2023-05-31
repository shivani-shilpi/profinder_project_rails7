class DragController < ApplicationController
    def plant
       @plant = Plant.find(drag_plant_params[:id])
       @plant.insert_at(drag_plant_params[:position].to_i + 1)
    end

    private

    def drag_plant_params
       params.require(:resource).permit(:id, :position)
    end
end
