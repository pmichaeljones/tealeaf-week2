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

  def hit_or_stay

  end

end


class Dealer

  def dealer_rules(count)  #takes current count, returns True if dealer hits and False if dealer stays

  end

end


class Card

end


class Deck_of_Cards

  def deal
  end

end


class BlackJack

end







# This module is to be included in any class where a score needs to be evaluated
module Scoring

  def evaluate_score(cards) #passing in an array of cards as parameter
  end

end






# -------------------------------------------------------------- #


# Step 5. Create 'Game Engine' Class called BlackJack

class BlackJack #Make a bunch of objects play nicely together
end




