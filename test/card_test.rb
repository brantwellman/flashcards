require_relative '../lib/card'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class CardTest< Minitest::Test

  def test_card_exists
    assert Card
  end
end
