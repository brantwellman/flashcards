require_relative 'card'

class CardGenerator
  attr_reader :data_lines

  def initialize(filename)
    @file = File.new(filename, 'r')
    @data_lines = @file.readlines
    sanitize_new_line
  end

  def sanitize_new_line
    @data_lines.map { |line| line.chomp! }
  end

  def cards
    @data_lines.map do |line|
      data = line.split(',')
      Card.new(data[0], data[1])
    end
  end
end
