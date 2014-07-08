class Country < ActiveRecord::Base
  has_many :feeling

  MAX_BUBBLE_SIZE = 50
  MIN_BUBBLE_SIZE = 3

  def self.countries_json
    countries = []
    self.all.each {|country| countries << country.to_json}
    {
      map:    "worldLow", 
      images: countries
    }
  end

  def to_json
    
    count = self.feeling.count
    {
      title:     name, 
      value:     10, 
      latitude:  latitude, 
      longitude: longitude,
      type:      "circle", 
      color:     self.random_color, 
      alpha:     0.5,
      width:     10,
      height:    10
    }
  end

  def random_color
    color = "#"
    array = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']
    6.times {color = color << array.sample} 
    color
  end
end
