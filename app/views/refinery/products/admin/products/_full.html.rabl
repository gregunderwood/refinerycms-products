object @product

attributes :id, :name, :description

child :photos do |photo|
  
  attributes :id, :title, :description
  
  child :picture do |picture|
    
    attributes :id
    
    node :url do |image|
      image.thumbnail.url
    end
    
  end
  
end
