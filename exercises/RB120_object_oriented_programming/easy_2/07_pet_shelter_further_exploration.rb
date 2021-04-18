class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end
end

class Owner
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

class Shelter
  def initialize(pets_list)
    @adoption_list = {}
    @pets_to_adopt = pets_list
  end

  def adopt(owner, pet)
    owner.pets << pet
    register_owner(owner, pet)
    pets_to_adopt.delete(pet)
  end

  def register_owner(owner, pet)
    if adoption_list[owner]
      adoption_list[owner] << pet
    else
      adoption_list[owner] = [pet]
    end
  end

  def print_adoptions
    adoption_list.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"

      pets.each do |pet|
        puts "a #{pet.animal} named #{pet.name}"
      end
      puts ""
    end
  end

  def print_not_adopted
    puts 'The Animal Shelter has the following unadopted pets:'
    pets_to_adopt.each do |pet|
      puts "a #{pet.animal} named #{pet.name}"
    end
  end

  def print_remaining
    puts "The Animal Shelter has #{pets_to_adopt.size} unadopted pets."
  end

  private

  attr_accessor :adoption_list, :pets_to_adopt
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new([butterscotch, pudding, darwin, kennedy,
                       sweetie, molly, chester])
shelter.print_not_adopted
shelter.print_remaining

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
shelter.print_remaining
