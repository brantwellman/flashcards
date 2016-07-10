require_relative '../lib/card_generator'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
class CardGeneratorTest < Minitest::Test

  def test_generator_exists
    assert CardGenerator
  end

  def test_can_readlines_from_one_line_file
    generator = CardGenerator.new("test/fixture1.txt")
    expected = "Where would you rather be?,Alaska"

    assert_equal expected, generator.data_lines.first
  end

  def test_can_readlines_from_two_line_file
    generator = CardGenerator.new("test/fixture2.txt")
    question_1 = "Where would you rather be?,Alaska"
    question_2 = "Who will always have your heart?,Alfie"

    assert_equal question_1, generator.data_lines[0]
    assert_equal question_2, generator.data_lines[1]
  end

  def test_can_eliminate_newline_characters
    generator = CardGenerator.new("test/fixture2.txt")
    question_1 = "Where would you rather be?,Alaska"
    question_2 = "Who will always have your heart?,Alfie"

    assert_equal question_1, generator.data_lines[0]
    assert_equal question_2, generator.data_lines[1]
  end

  def test_creates_cards_from_one_dataline
    generator = CardGenerator.new("test/fixture1.txt")
    cards = generator.cards

    assert_equal "Where would you rather be?", cards[0].question
    assert_equal "Alaska", cards[0].answer
  end

  def test_creates_cards_from_two_datalines
    generator = CardGenerator.new("test/fixture2.txt")
    cards = generator.cards

    assert_equal "Where would you rather be?", cards[0].question
    assert_equal "Alfie", cards[1].answer
  end

end
