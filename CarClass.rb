class Vehicle
  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} per mile is your mileage."
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

end

class MyCar < Vehicle

  attr_accessor :color, :model, :current_speed
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    self.color = color
    self.model = model
    @current_speed = 0
  end

end
