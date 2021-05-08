class StudentBody
  @@total_students = 0

  def initialize
    @@total_students += 1
  end

  def self.number_of_students
    puts "There are #{@@total_students} students this year."
  end
end

class Student < StudentBody
  def initialize(name, year)
    @name = name
    @year = year
    super()
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

pierre      = Student.new('Pierre', 2)
andre       = Student.new('André', 2)
jacques_maj = Student.new('Jacques le Majeur', 2)
jean        = Student.new('Jean', 2)
philippe    = Student.new('Philippe', 2)
barthelemy  = Student.new('Barthélemy', 2)
thomas      = Student.new('Thomas', 2)
matthieu    = Student.new('Matthieu', 2)
jacques_min = Student.new('Jacques le Mineur', 2)
jude        = Student.new('Jude', 2)
simon       = Student.new('Simon', 2)
judas       = Student.new('Judas', 2)

StudentBody.number_of_students
