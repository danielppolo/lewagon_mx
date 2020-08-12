class PetsController < ApplicationController
  before_action :find_pet, only: %i[show edit update destroy]

  def index
    @pets = Pet.all
  end

  def show; end

  def new
    # TO Return the HTML with the Form
    @pet = Pet.new
  end

  def create
    # Receive the data from the form, and will create a record
    @pet = Pet.new(strong_params)
    @pet.found_on = Date.today
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    # TO Return the HTML with the Form
  end

  def update
    # Receive the data from the form, and will create a record

    @pet.update(strong_params)

    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy

    redirect_to pets_path
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def strong_params
    params.require(:pet).permit(:name, :address, :species)
  end
end
