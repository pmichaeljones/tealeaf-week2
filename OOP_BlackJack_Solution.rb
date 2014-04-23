# Exact the primary nouns
class Card
  attr_accessor :suit, :face_value

  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
  end

  def pretty_output
    "The #{face_value} of #{find_suit}"
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
      ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].each do |value|
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
      break if total <= BlackJack::BLACKJACK_AMOUNT
      total -= 10
    end

    total

  end

  def is_busted?
    total > BlackJack::BLACKJACK_AMOUNT
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

  def show_flop
    puts "---- Dealer's Hand -----"
    puts "=> First card is hidden."
    puts "=> Second card is #{cards[1]}"
  end


end

class BlackJack
  attr_accessor :player, :deck, :dealer

  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17

  def initialize
    @deck = Deck.new
    @player = Player.new("Player1")
    @dealer = Dealer.new

  end

  def set_player_name
    puts "What's your name?"
    player.name = gets.chomp
  end

  #back and forth dealing for player and dealer
  def deal_cards
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end

  def show_flop
    player.show_hand
    dealer.show_flop
  end

  # checking for score busting
  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry, dealer hit BlackJack. #{player.name} loses."
        play_again?
      else
        puts "Congrats. #{player.name} hit BlackJack. #{player.name} wins!"
        play_again?
      end

    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Player)
        puts "Sorry, #{player.name} busted. #{player.name} loses."
        play_again?
      else
        puts "Congrats, dealer busted. #{player.name} wins!"
        play_again?
      end
    end

  end

  def play_again?
    puts ""
    puts "Would you like to play again? 1)Yes 2)No"
    if gets.chomp == "1"
      puts "Starting new game..."
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Goodbye!"
      exit
    end
  end


  # define the player's turn and logic
  def player_turn
    puts "It's #{player.name}'s turn."

    blackjack_or_bust?(player)

    while !player.is_busted?
      puts "What do you want to do? 1) Hit 2) Stay"
      response = gets.chomp

      if !["1", "2"].include?(response)
        puts "Error, you must enter 1 or 2."
        next
      end

      if response == "2"
        puts "#{player.name} choses to stay."
        break
      end

      new_card = deck.deal_one
      puts "Dealing card to #{player.name}: #{new_card}"
      player.add_card(new_card)
      puts "#{player.name}'s total is now: #{player.total}"

      blackjack_or_bust?(player)

    end
  end

  def dealer_turn
    puts "Dealer's Turn."
    puts ""
    puts "Dealer has: #{dealer.cards[0]} and #{dealer.cards[1]}."

    blackjack_or_bust?(dealer)

    while dealer.total < DEALER_HIT_MIN
      new_card = deck.deal_one
      puts "Dealing card to dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer total is now: #{dealer.total}"
    end

    blackjack_or_bust?(dealer)

    puts "Dealer stays with: #{dealer.total}."
    who_won?
  end

  def who_won?
    if player.total > dealer.total
      puts "Congrats. #{player.name}'s #{player.total} beats the dealer's #{dealer.total}. #{player.name} wins!"
    elsif player.total < dealer.total
      puts "Sorry. The dealer's #{dealer.total} beats #{player.name}'s #{player.total}. #{player.name} loses."
    else
      puts "It's a push. House wins. Sorry."
    end

    play_again?

  end

  # running this method will start the game off. It executes all other methods.
  def start
    set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
  end

end

game = BlackJack.new
game.start


