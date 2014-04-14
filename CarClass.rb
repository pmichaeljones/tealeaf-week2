class MyCar
  attr_accessor :year, :color, :model, :current_speed

  def initialize(year, color, model)
    self.year = year
    self.color = color
    self.model = model
    @current_speed = 0
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

    puts "The car is already stopped."

  end

  def shut_off
    self.current_speed = 0
  end


end
