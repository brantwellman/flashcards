require_relative 'guess'

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
    deck.cards.shift
  end

  def percent_correct
    ((number_correct.to_f / guesses.size.to_f) * 100).to_i
  end

  def start
    welcome
    game_loop
    summary
  end

  def welcome
    puts "Welcome! You're playing with #{deck.cards.count} cards."
    puts "-------------------------------------------------"
  end

  def game_loop
    deck_size = deck.cards.count
    until deck.cards.count == 0 do
      puts "This is card number #{guesses.size + 1} out of #{deck_size}"
      puts "Question: #{current_card.question}"
      response = gets.chomp
      record_guess(response)
      puts "#{guesses.last.feedback}"
    end
  end

  def summary
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{guesses.size} for a score of #{percent_correct}%."
  end
end
