require_relative 'card'
require_relative 'deck'
require_relative 'round'
require_relative 'card_generator'

cards = CardGenerator.new('card.txt').cards
deck = Deck.new(cards)
Round.new(deck).start
