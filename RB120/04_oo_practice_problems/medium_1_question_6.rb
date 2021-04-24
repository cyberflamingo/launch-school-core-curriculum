class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

=begin
The first class does not make use of the `template` getter method and use
instance variable `@template` directly in instance method `show_template`.

On the other hand the second Computer class uses both getter and setter for
`template`. The `self` on instance method `show_template` is redundant though.
=end
