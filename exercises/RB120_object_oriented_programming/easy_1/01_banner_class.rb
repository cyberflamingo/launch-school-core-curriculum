class Banner
  def initialize(message)
    @message = message
    @char_number = message.size
  end

  def to_s
    [horizontal_rule, empty_line, message_line,
     empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :char_number

  def horizontal_rule
    '+-' + ('-' * char_number) + '-+'
  end

  def empty_line
    '| ' + (' ' * char_number) + ' |'
  end

  def message_line
    "| #{message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner
