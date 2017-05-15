# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class NumericBadConsequence < BadConsequence
    def initialize (t, l, nVisible, nHidden)
      super(t,l)
      @nVisibleTreasures = nVisible
      @nHiddenTreasures = nHidden
    end
    
    def isEmpty
      (@nVisibleTreasures == 0) && (@nHiddenTreasures == 0)
    end
    
    def substractVisibleTreasure (t)
      @nVisibleTreasures = [0, @nVisibleTreasures -1].max if !isEmpty
    end
    
    def substractHiddenTreasure (t)
      @nHiddenTreasures = [0, @nHiddenTreasures -1].max if !isEmpty
    end
    
    def adjustToFitTreasureLists (v, h)
      unless isEmpty
        nVisibleTreasures = [@nVisibleTreasures, v.size].min
        nHiddenTreasures = [@nHiddenTreasures, h.size].min
        
        NumericBadConsequence.new(@text, @levels, nVisibleTreasures, nHiddenTreasures)
      else
        NumericBadConsequence.new(@text, @levels, 0, 0)
      end
      
      
    end
    
    def to_s
      "\nText: #{@text} \nLevels: #{@levels} \nNum of Visible Treasures: #{@nVisibleTreasures} \nNum of Hidden Treasures: #{@nHiddenTreasures}"
    end
  end
end
