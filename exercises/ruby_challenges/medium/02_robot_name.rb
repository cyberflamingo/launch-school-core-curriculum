class Robot
  @@allocated_names = []

  ALPHABET = ('A'..'Z').to_a

  attr_reader :name

  def initialize
    @name = generate_uniq_name
    @@allocated_names << @name
  end

  def reset
    @@allocated_names.delete(name)
    self.name = generate_uniq_name
  end

  private

  attr_writer :name

  def generate_uniq_name
    name = ''

    while  @@allocated_names.include?(name) || name.empty?
      name = ALPHABET.sample +
             ALPHABET.sample +
             random_string_num +
             random_string_num +
             random_string_num
    end

    name
  end

  def random_string_num
    (rand() * 10).to_i.to_s
  end
end

# Time: 00:14:18.7
