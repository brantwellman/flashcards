require_relative '../lib/round'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/guess'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RoundTest < Minitest::Test

  def setup
    @card1 = Card.new("Where would you rather be?", "Alaska")
    @card2 = Card.new("Who will always have your heart?", "Alfie")
    @deck = Deck.new([@card1, @card2])
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert Round
  end

  def test_it_is_initialized_with_deck
    assert_equal @deck, @round.deck
  end

  def test_it_is_initialized_with_empty_guesses_array
    assert_equal [], @round.guesses
  end

  def test_it_returns_the_current_card
    assert_equal @card1, @round.current_card
  end

  def test_it_records_guess_and_saves_in_guesses
    @round.record_guess('Alaska')

    assert_equal 'Alaska', @round.guesses.first.response
    assert_equal 1, @round.guesses.count
  end

  def test_it_returns_correct_for_proper_response
    @round.record_guess('Alaska')

    assert_equal 'Correct!', @round.guesses.first.feedback
  end

  def test_it_records_incorrect_for_wrong_response
    @round.record_guess('Texas')

    assert_equal 'Incorrect.', @round.guesses.first.feedback

  end

  def test_it_records_number_of_correct_guesses
    @round.record_guess('Alaska')

    assert_equal 1, @round.number_correct

    @round.record_guess('Alfie')

    assert_equal 2, @round.number_correct
  end

  def test_after_guess_new_current_card_is_next_in_list
    @round.record_guess('Alaska')

    assert_equal @card2, @round.current_card
  end

  def test_it_doesnt_increase_correct_count_for_incorrect_guess
    @round.record_guess('Alaska')
    assert_equal 1, @round.number_correct
    @round.record_guess('a cat')

    assert_equal 1, @round.number_correct
  end

  def test_it_records_percent_correct
    @round.record_guess('Alaska')
    @round.record_guess('a cat')

    assert_equal 50, @round.percent_correct
  end

  def test_it_returns_100_for_all_correct
    @round.record_guess('Alaska')
    @round.record_guess('Alfie')

    assert_equal 100, @round.percent_correct
  end

end
