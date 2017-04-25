# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class CultistPlayer < Player
    @@totalCultistPlayers = 0
    
    def initialize(p, c)
      cpy(p)
      @myCultistCard = c
    end
    
    def getCombatLevel
      1.7 * super + @myCultistCard.getGainedLevels
    end
  end
end
