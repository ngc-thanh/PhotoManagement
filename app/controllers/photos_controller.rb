class PhotosController < ApplicationController

    before_action :set_dropdown, only: [:show, :new] 
    before_action :set_photo_show, only: [:download_image]
    before_action :set_active_storage_host

    def index

    end

    def show
        @photo = Photo.find(params[:id])
        
    end

    def download_image
        redirect_to @photo_show.service_url
    end

    def new
        @photo = Photo.new
    end

    def create

        @photo = Photo.create(photo_params)

        redirect_to @photo

    end

    private
    def set_dropdown
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

    def photo_params

        params.require(:photo).permit(:shooting_date, :content, :photographer, permissions: [], photos: [])

    end

    def set_active_storage_host
        ActiveStorage::Current.host = request.base_url
    end  
    
    def set_photo_show
        @photo_show = Photo.find(params[:photo_id]).photos.first
    end


end