class Photo < ApplicationRecord

    has_one_attached :photo

    def delete_date
        @delete_date
    end
    
end