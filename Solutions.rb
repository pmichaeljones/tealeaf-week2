class Vehicle
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def initialize
    @@number_of_vehicles += 1
    puts "Vehicle superclass was instantiated. Bitches!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.how_many
    @@number_of_vehicles
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  #code omitted for brevity...

  def initialize
    puts "MyCar subclass was just instantiated. Bitches!"
  end

end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end