class Photo < ApplicationRecord

    has_many_attached :photos
    has_many_attached :permissions
    has_many :taggings
    has_many :tags, through: :taggings
    belongs_to :photographer

    scope :with_tag, ->(tag) do
        joins("inner join taggings on taggings.photo_id = photos.id inner join tags on tags.id = taggings.tag_id").
        where("lower(tags.name) LIKE ?", "%#{tag.downcase}%")
    end

    def self.search(search, tag)
        @photos = Photo.all.includes(:tags)
        if search
            @photos = @photos.where("lower(photographer) LIKE ?", "%#{search.downcase}%").includes(:tags) + (@photos.with_tag(search.downcase).includes(:tags))
        end

        @photos = @photos.with_tag(tag).includes(:tags) if tag
        @photos
    end
    
    def self.tag_counts
        Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end
    
    def tag_list
        tags.map(&:name).join(', ')
    end
    
    def tag_list=(names)
        self.tags = names.split(',').map do |n|
          Tag.where(name: n.strip).first_or_create!
        end
    end


    
end