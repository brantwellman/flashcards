require_relative 'card'
require_relative 'deck'
require_relative 'round'
require_relative 'card_generator'

if ARGV[0] == nil
  cards = CardGenerator.new('card.txt').cards
  deck = Deck.new(cards)
  Round.new(deck).start
else
  loop do
    if File.file?(ARGV[0])
      cards = CardGenerator.new(ARGV[0]).cards
      deck = Deck.new(cards)
      Round.new(deck).start_without_file_check
      break
    else
      puts "That wasn't a valid card file. Please try again."
      break
    end
  end
end
