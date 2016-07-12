require_relative '../lib/card_generator'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class CardGeneratorTest < Minitest::Test

  def setup
    @generator_1 = CardGenerator.new("test/fixture1.txt")
    @generator_2 = CardGenerator.new("test/fixture2.txt")

    @question_1 = "Where would you rather be?,Alaska"
    @question_2 = "Who will always have your heart?,Alfie"
  end

  def test_generator_exists
    assert CardGenerator
  end

  def test_can_readlines_from_one_line_file
    expected = "Where would you rather be?,Alaska"

    assert_equal expected, @generator_1.data_lines.first
  end

  def test_can_readlines_from_two_line_file
    assert_equal @question_1, @generator_2.data_lines[0]
    assert_equal @question_2, @generator_2.data_lines[1]
  end

  def test_can_eliminate_newline_characters
    assert_equal @question_1, @generator_2.data_lines[0]
    assert_equal @question_2, @generator_2.data_lines[1]
  end

  def test_creates_cards_from_one_dataline
    cards = @generator_1.cards

    assert_equal "Where would you rather be?", cards[0].question
    assert_equal "Alaska", cards[0].answer
  end

  def test_creates_cards_from_two_datalines
    cards = @generator_2.cards

    assert_equal "Where would you rather be?", cards[0].question
    assert_equal "Alfie", cards[1].answer
  end
end
