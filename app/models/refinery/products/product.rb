module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      self.table_name = 'refinery_products'
      
      has_many :photos, :class_name => '::Refinery::Products::Photo'
      
      attr_accessible :name, :description, :position

      acts_as_indexed :fields => [:name, :description]

      validates :name, :presence => true, :uniqueness => true
      
      def update_photos(photos_hash)
        photos.each do |p|
          unless photos_hash.keys.include? p.id.to_s
            p.destroy
          else
            photo = photos_hash[p.id.to_s]
            p.update_attributes :title => photo["title"], :description => photo["decription"],
                                :picture_id => photo['picture_id']
          end
        end
        photos_hash.each do |id, photo|
          if id.match(/^c/)
            photo = photos.build :title => photo["title"], :description => photo["decription"],
                          :picture_id => photo['picture_id']
            photo.save!
          end
        end
      end
      
    end
    
    class Photo < Refinery::Core::BaseModel
      self.table_name = 'refinery_photos'
      
      belongs_to :product, :class_name => "::Refinery::Products::Product"
      belongs_to :picture, :class_name => "::Refinery::Image"
      
      attr_accessible :title, :description, :position, :picture_id, :product
    
      acts_as_indexed :fields => [:title, :description]

      validates :picture_id, :presence => true
    end
  end
end
