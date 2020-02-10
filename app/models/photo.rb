class Photo < ApplicationRecord

    has_many_attached :photos
    has_one_attached :permission

    def delete_date
        @delete_date
    end
    
end