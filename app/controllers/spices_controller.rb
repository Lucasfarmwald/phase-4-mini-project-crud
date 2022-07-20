class SpicesController < ApplicationController
    def index
        spice = Spice.all
        render json: spice
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)

        render json: spice, status: :created
    end

    def destroy
        spice = find_spice

        spice.destroy
        
    end


    private

    def find_spice
        spice = Spice.find_by(id: params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating )
    end
end
