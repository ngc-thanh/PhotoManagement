class PhotosController < ApplicationController

    before_action :set_dropdown, only: [:show, :new] 
    before_action :set_active_storage_host

    def index

        @photos = Photo.all

        params[:tag] ? @photos = Photo.tagged_with(params[:tag]) : @photos = Photo.all

    end
    
    def show
            @photo = Photo.find(params[:id])
    end

    def download_image
        @photo = Photo.find(params[:photo_id]).photos.first
        redirect_to @photo.service_url
        Photo.find(params[:photo_id]).update(download_date: Date.current, delete_date: (Date.current + 1.year))
    end

    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.create(photo_params).update(download_date: Date.current, delete_date: (Date.current + 1.year))
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

        params.require(:photo).permit(:shooting_date, :content, :photographer, :tag_list, :tag, { tag_ids: [] }, :tag_ids, permissions: [], photos: [])

    end

    def set_active_storage_host
        ActiveStorage::Current.host = request.base_url
    end  
end