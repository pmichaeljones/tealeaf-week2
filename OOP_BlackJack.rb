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

class Player
  attr_accessor :name
  attr_reader :score, :hand

  include Scoring

  def initialize(name)
    @name = name
    @hand = [] #[card_object_1, card_object_2, card_object_3, etc]
    @score = 0
  end

  def score
    evaluate_score(self.hand)
  end

  def hand=(value)
      @hand << value
  end


end


class Dealer
  attr_reader :score, :hand

  include Scoring

  def initialize
    @name = "Mr. Dealer"
    @hand = []
    @score = 0
  end

  def hand=(value)
    @hand << value
  end

  def score
    evaluate_score(self.hand)
  end

  private

  def dealer_rules  #takes current count, returns True if dealer hits and False if dealer stays
    if self.score < 16
      #HIT
    elsif self.score >= 16
      #stay
    end

  end

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





###------START MODULES--------####


module Scoring # This module is to be included in any class where a score needs to be evaluated

  def evaluate_score(cards)
    #an array of objects [<obj12345 Spade Ace>, <ob12345 Club King>]
  total = 0
  cards.each do |x|
    if x.value == "Ace"
      total += 11
    elsif x.value.to_i == 0 # J, Q, K
      total += 10
    else
      total += x.value.to_i
    end

  end

  #correct for Aces
  cards.select{|e| e.value == "Ace"}.count.times do
    total -= 10 if total > 21
  end

  total
  end

end


###-----END MODULES---------###




# -------------------------------------------------------------- #


# Step 5. Create 'Game Engine' Class called BlackJack

class BlackJack
  include Scoring

   def hit_or_stay

  end

end
