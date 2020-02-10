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

    def datepicker_input form, field
        content_tag :td, :data => {:provide => 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-autoclose' => 'true'} do
          form.text_field field, class: 'form-control', placeholder: 'YYYY-MM-DD'
        end
    end

    private
    def photo_params

        params.require(:photo).permit(:shooting_date, :content, :photographer, :permission, photos: [])

    end

end