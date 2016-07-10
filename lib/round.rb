require 'pry'
class Round
  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    deck.cards.first
  end

  def record_guess(response)
    guess = Guess.new(response, current_card)
    guesses << guess
    increment_correct if guess.correct?
    discard_card
  end

  def increment_correct
    @number_correct +=1
  end

  def discard_card
    @deck.cards.shift
  end

  def percent_correct
    (@number_correct.to_f / @guesses.size.to_f) * 100
  end
end
