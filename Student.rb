class Student
  attr_accessor :name

  def initialize(name, grade)
    self.name = name
    @grade = grade
  end


  def better_grade_than?(student)
    if grade < student.grade
      puts "Worse Grade"
    else
      puts "Better Grade"
    end

  end

  private

  def grade
    @grade
  end

end
