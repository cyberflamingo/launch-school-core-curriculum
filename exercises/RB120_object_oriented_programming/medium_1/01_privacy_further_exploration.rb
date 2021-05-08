class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def show_flip_state
    puts switch
  end

  private

  attr_reader :switch
  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
machine.start
machine.show_flip_state
machine.stop
machine.show_flip_state
