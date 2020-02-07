class PhotosController < ApplicationController

    def index

    end

    def new

        @photo = Photo.new

    end

    def create

        @photo = Photo.find(params[:id])
        @photo.create(photo_params)

        redirect_to @photo

    end

    private
    def photo_params

        params.require(:user).permit(:shooting_date, :content, :photographer)

    end

end