# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  class Monster
    attr_reader :name
    attr_reader :level
    attr_reader :badConsequence 

    def initialize(n, l, b, p)
      @name = n
      @level = l
      @prize = p
      @badConsequence = b
    end
    
    def to_s
      "Name: #{@name} \nLevel: #{@level} \nPrize: #{@prize} \nBad Consequence #{@badConsequence}"
    end
    def getLevelsGained
      @prize.levels
    end
    def getTreasuresGained
      @prize.treasures
    end
  end
end
