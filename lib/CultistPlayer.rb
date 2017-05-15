# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class CultistPlayer < Player
    @@totalCultistPlayers = 0
    
    def initialize(p, c)
      @@totalCultistPlayer += 1
      cpy(p)
      @myCultistCard = c
    end
    
        
    protected
    
    #TODO Revisar private
    def canYouGiveMeATreasure
      !@visibleTreasures.empty?
    end
    
    #TODO Revisar private
    def giveMeATreasure
      treasure = @visibleTreasures.sample
      discardVisibleTreasure(treasure)
      treasure
    end
    
    def getOponentLevel(m)
      m.getCombatLevelAgainstCultistPlayer
    end
    
    def getCombatLevel
      (1.7 * super + @myCultistCard.getGainedLevels*@@totalCultistPlayer).to_i
    end
    
    def shouldConvert
      false
    end
  end
end
