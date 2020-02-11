class Photo < ApplicationRecord

    has_many_attached :photos
    has_many_attached :permissions

    def delete_date
        @delete_date
    end
    
end