require_relative 'card'
require_relative 'deck'
require_relative 'round'

card_1 = Card.new("Where would you rather be?", "Alaska")
card_2 = Card.new("Who will always have your heart?", "Alfie")
card_3 = Card.new("How many times have you almost died?", "2")

deck = Deck.new([card_1, card_2, card_3])

round = Round.new(deck)
round.start
