module Off_Road
  def go_off_road
    puts "We're off roading!"
  end

end


class Vehicle
  @@vehicles_created = 0

  def self.how_many_created
    puts @@vehicles_created
  end

  def speed_up(amount)
    self.current_speed += amount
    puts "The car is traveling #{self.current_speed} MPH."
  end

  def brake(amount)
    unless self.current_speed <= 0
      self.current_speed -= amount
      if self.current_speed < 0
        self.current_speed = 0
      end
      puts "The car is now going #{self.current_speed} MPH."
    end
  end

  def shut_off
    self.current_speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def age
    age_of_vehicle
  end


  private

  def age_of_vehicle
    Time.new.year.to_i - @year
  end


end

class MyTruck < Vehicle
  attr_accessor :color, :model, :current_speed
  attr_reader :year

  include Off_Road

  def initialize(year, color, model)
    @@vehicles_created += 1
    @year = year
    self.color = color
    self.model = model
    @current_speed = 0
  end



end


class MyCar < Vehicle
  attr_accessor :color, :model, :current_speed
  attr_reader :year

  def initialize(year, color, model)
    @@vehicles_created += 1
    @year = year
    self.color = color
    self.model = model
    @current_speed = 0
  end

end
