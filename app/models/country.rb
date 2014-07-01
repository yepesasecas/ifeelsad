class Country < ActiveRecord::Base
  has_many :feeling

  def self.countries_json
    countries = []
    self.all.each {|country| countries << country.to_json}
    {map: "worldLow", images: countries}
  end

  def to_json
    {
       title: name, 
       value: self.feeling.count, 
    latitude: latitude, 
   longitude: longitude,
        type:"circle", 
       color:"#6c00ff", 
       width: bubble_size,
      height: self.feeling.count}
  end

  def bubble_size
    3
  end
end
