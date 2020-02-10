class Photo < ApplicationRecord

    has_one_attached :photo
    has_one_attached :permission

    def delete_date
        @delete_date
    end
    
end