class PlantLabelsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_label = PlantLabel.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    list_label_ids = params[:plant_label][:label_id]
    list_label_ids.shift # Delete first
    
    list_label_ids.each do |banana|
      unless PlantLabel.create(label_id: banana, plant: @plant)
        render :new
        return #Exit the create action
      end
    end
    
    redirect_to garden_path(@plant.garden)
  end

  private


  def plant_label_params
    params.require(:plant_label).permit(:label_id)
  end 
end
