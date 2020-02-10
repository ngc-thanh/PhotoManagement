class PhotosController < ApplicationController

    def index

    end

    def show

        @photo = Photo.find(params[:id])

    end

    def new

        @photo = Photo.new

    end

    def create

        @photo = Photo.create(photo_params)

        redirect_to @photo

    end

    private
    def photo_params

        params.require(:photo).permit(:shooting_date, :content, :photographer, :photo, :permission)

    end

end