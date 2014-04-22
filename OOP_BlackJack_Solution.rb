# Exact the primary nouns
class Card
  attr_accessor :suit, :face_value

  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
  end

  def pretty_output
    "The #{face_value} of #{find_suit}."
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
    puts "--- #{name}'s Hand ---"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end

  def total
    face_values = cards.map{|card| card.face_value}

    total = 0
    face_values.each do |val|
      if val == "Ace"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
    end

    #correct for aces
    face_values.select{|val| val == "Ace"}.count.times do
      break if total <= 21
      total -= 10
    end

    total

  end


  def add_card(new_card)
    cards << new_card
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

  attr_accessor :cards, :name

  def initialize
    @name = "Dealer"
    @cards = []
  end

end

deck = Deck.new
player = Player.new("Patrick")
player.add_card(deck.deal_one)
player.add_card(deck.deal_one)

player.show_hand
player.total

dealer = Dealer.new
dealer.add_card(deck.deal_one)
dealer.add_card(deck.deal_one)
dealer.show_hand
dealer.total



