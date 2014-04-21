# Exact the primary nouns
class Card
  attr_accessor :suit, :face_value

  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
  end

  def pretty_output
    puts "The #{face_value} of #{find_suit}."
  end

  def card
    pretty_output
  end

  def to_s
    pretty_output
  end

  def find_suit
    case suit
      when "H" then "Hearts"
      when "D" then "Diamonds"
      when "C" then "Clubs"
      when "S" then "Spades"
    end
  end


end


class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ['H', 'D', 'C', 'S'].each do |suit|
      ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].each do |value|
        @cards << Card.new(suit, value)
        @cards = @cards.shuffle
        end
      end
  end

  def deal_one
    cards.pop
  end


end

require 'pry'

module Hand

  def show_hand
  end

  def total
  end

  def add_card(new_card)
    binding.pry
    cards << new_card #why isn't this self.cards or @cards? It works both way, but why doesn't Ruby think "cards" is an undefined local variable?
    binding.pry
  end

end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []

  end

end


class Dealer
  include Hand

  attr_accessor :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end


end

patrick = Player.new("Patrick")
patrick.add_card("Ace_of_Spades")


