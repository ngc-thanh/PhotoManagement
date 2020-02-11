class PhotosController < ApplicationController

    def index

    end

    def show

        @photo = Photo.find(params[:id])

    end

    def new

        @photo = Photo.new

        
        photo = Photo.all
        @photographers = []
        @contents = []
        photo.each do |image|
            unless image.photographer.to_s.empty?
                @photographers << Array.new(2, image.photographer)
            end
            unless image.content.to_s.empty?
                @contents << Array.new(2, image.content)
            end
        end

    end

    def create

        @photo = Photo.create(photo_params)

        redirect_to @photo

    end

    private
    def photo_params

        params.require(:photo).permit(:shooting_date, :content, :photographer, :permission, photos: [])

    end

end