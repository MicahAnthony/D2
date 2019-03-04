# Class that finds loaction on map and gets its index in 2D array
class MapFinder
  # Method to get which index new  location is in in the2D array
  def get_location_index(location)
    index = if location == 'Enumerable Canyon'
              0
            elsif location == 'Duck Type Beach'
              1
            elsif location == 'Monkey Patch City'
              2
            elsif location == 'Nil Town'
              3
            elsif location == 'Matzburg'
              4
            elsif location == 'Hash Crossing'
              5
            elsif location == 'Dynamic Palisades'
              6
            end
    index
  end
end
