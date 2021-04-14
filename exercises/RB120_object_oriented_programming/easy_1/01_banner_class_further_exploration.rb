class Banner
  def initialize(message, width = message.size)
    @message = message
    @width = message.size < width ? width : message.size
  end

  def to_s
    [horizontal_rule, empty_line, message_line,
     empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :width

  def horizontal_rule
    '+-' + ('-' * width) + '-+'
  end

  def empty_line
    '| ' + (' ' * width) + ' |'
  end

  def message_line
    "| #{message.center(width)} |"
  end
end

banner_default = Banner.new('To boldly go where no one has gone before.')
banner_too_small = Banner.new('To boldly go where no one has gone before.', 10)
banner_too_large = Banner.new('To boldly go where no one has gone before.', 70)
puts banner_default
puts banner_too_small
puts banner_too_large
