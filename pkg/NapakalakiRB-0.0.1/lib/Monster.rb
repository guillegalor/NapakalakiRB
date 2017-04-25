# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  class Monster
    #TODO Ask if we have to create a new constructoror just let it like it is
    def initialize (n, l, b, p, lC)
      @name = n
      @level = l
      @prize = p
      @badConsequence = b
      @levelChangeAgainstCultistPlayer = lC
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
    
    def getCombatLevel
      @level
    end
    
    def getBadConsequence
      @badConsequence
    end
    
    def getName
      @name
    end
    
    def getCombatLevelAgainstCultistPlayer
      @level + @levelChangeAgainstCultistPlayer
    end
  end
end
