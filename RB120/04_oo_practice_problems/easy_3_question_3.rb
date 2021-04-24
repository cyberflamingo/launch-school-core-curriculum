class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

olive = AngryCat.new(3, 'Olive')
tom = AngryCat.new(4, 'Tom')

olive.age
olive.name

tom.age
tom.name
