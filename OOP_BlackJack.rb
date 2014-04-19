# STEPS TO CREATING AN OOP APPLICATION ###

# 1. Create the requirements and specifications of the blackjack game.
# 2. Extract the nouns and turn them into classes.
# 3. Extract the verbs and turn them into instance methods.
# 4. Group instance methods into classes
# 5. Create a 'Game Engine' that makes the objects interact with one another

# -------------------------------------------------------------- #

# Step 1: Game Specifications #
# - Ask for the players name
# - The deck is shuffled and cards are dealt in a back& forth manner
# - - Dealer has 1 face-up and 1 face-down card. Players cards are both face-up
# - Player hits or stays until they reach 21, break 21, or choose to stay
# - Dealer has a set of rules to follow for their hit & stay procedures
# - After dealer has completed turn, the hands are evaluated to see who wins
# - After completion, player is asked if they want to play again

# -------------------------------------------------------------- #

# Step 2. Extract Major Nouns #
# Player
# Dealer
# Cards
# Deck
# The Game of Blacjack (game engine)

# -------------------------------------------------------------- #

# Step 3. Extract Major Verbs #
# Deal
# Shuffle
# Evaluate Score
# Hit or Stay
# Bust

# -------------------------------------------------------------- #

# Step 4. Group Methods into Classes #

###------START MODULES--------####


# This module is to be included in any class where a score needs to be evaluated
module Hand
  attr_accessor :hand, :score

  def initialize
    @hand = []
    @score = 0
  end

  def evaluate_score(cards)
    #an array of objects [<obj12345 @suit = 'Spade' @value = 'Ace'>, <ob12345 @suit = 'Club', @value = 'King'>]
  self.score = 0
  cards.each do |x|
    if x.value == "Ace"
      self.score += 11
    elsif x.value.to_i == 0 # J, Q, K
      self.score += 10
    else
      self.score += x.value.to_i
    end

    end

    #correct for Aces
    cards.select{|e| e.value == "Ace"}.count.times do
      self.score -= 10 if self.score > 21
  end

  self.score
  end

  def add_card(card)
      self.hand << card
  end

end


###-----END MODULES---------###

class Player
  attr_accessor :name

  include Hand

  def initialize(name)
    super()
    @name = name
  end

end


class Dealer
  attr_reader :score, :hand

  include Hand

  def initialize
    super()
    @name = "Mr. Dealer"
  end

  private

  #FIGURE OUT DEALER TURN

  # def dealer_turn  #takes current count, returns True if dealer hits and False if dealer stays
  #   if self.score == 21
  #     puts "Dealer got BlackJack and wins."
  #     exit
  #   elsif self.score < 16
  #     puts "Dealer has less than 16 and must hit."
  #     self.hand=

  #   elsif self.score >= 16
  #     puts "Dealer has over 17 and must stay."
  #   end

  # end

end


class Card
  attr_accessor :name, :value, :suit

  def initialize(value, suit)
    @name = "#{value} of #{suit}"
    @value = value
    @suit = suit
  end

end


class Deck
  attr_accessor :cards

  def initialize
  @cards = []
  [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].each do |value|
    ['Diamonds', 'Hearts', 'Spades', 'Clubs'].each do |suit|
      @cards << Card.new(value, suit)
      @cards = @cards.shuffle
    end #ends innder DO
  end #ends outer DO
  end


  def deal
    self.cards.pop #returns 1 card
  end

end





# -------------------------------------------------------------- #


# Step 5. Create 'Game Engine' Class called BlackJack

class BlackJack
  attr_accessor :player, :deck, :dealer
  include Hand


  def initialize
    puts "Welcome. Let's get started. What's your name?"
    name = gets.chomp
    @player = Player.new("#{name}")
    @dealer = Dealer.new()
    @deck = Deck.new()
  end

  def play_game
    puts "Welcome, #{self.player.name}. Here is your first card."
    card1  = self.deck.deal
    self.player.add_card(card1)
    puts "You got a a #{card1.name}"

    card2 = self.deck.deal
    self.dealer.add_card(card2)
    puts "Dealer got a #{card2.name}"

    card3  = self.deck.deal
    self.player.add_card(card3)
    puts "You got a a #{card3.name}"

    card4 = self.deck.deal
    self.dealer.add_card(card4)
    puts "Dealer's last card is face down."

    player_total = self.player.evaluate_score(self.player.hand)
    puts "Your total is #{player_total}"

    next_move(self.player.hand)


  end

  def player_hit
    card = self.deck.deal
    self.player.add_card(card)
    puts "You got a #{card.name}"
    puts "Your total is now #{self.player.evaluate_score(self.player.hand)}"
  end

  def player_stay
  end


  def next_move(cards)
    if self.evaluate_score(cards) > 21
      puts "You busted. Sorry."
    elsif self.evaluate_score(cards) == 21
      puts "You hit BlackJack!"
    else
      puts "Your score is less than 21. Do you want to hit or stay?"
      response = gets.chomp.capitalize
      if response == "Hit"
        self.player_hit
      else
        self.player_stay
      end
    end
  end


end
