# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  class BadConsequence
    @@MAXTREASURES = 10
    attr_reader :levels
    attr_reader :nVisibleTreasures
    attr_reader :nHiddenTreasures
    attr_reader :specificVisibleTreasures
    attr_reader :specificHiddenTreasures

    def initialize(text, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
      @text = text
      @levels = someLevels
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
      @specificVisibleTreasures = someSpecificVisibleTreasures.to_a
      @specificHiddenTreasures = someSpecificHiddenTreasures.to_a
      @death = death
    end

    public
    def isEmpty
      (@nVisibleTreasures == 0) && (@nHiddenTreasure == 0) && @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
    end
    def self.newLevelNumberOfTreasures (t, l, nVisible, nHidden)
      new(t, l, nVisible, nHidden, nil, nil, false)
    end
    def self.newLevelSpecificTreasures (t, l, v, h)
      new(t, l, nil, nil, v, h, false)
    end
    def self.newDeath (t, death)
      new(t, nil, nil, nil, nil, nil, death)
    end
    def to_s
      "Text: #{@text} \nLevel: #{@levels} \nNum of visible treasures: #{@nVisibleTreasures} \nNum of hidden treasures: #{@nHiddenTreasures} \nSpecific visible treasures: #{@specificVisibleTreasures} \nSpecific hidden treasures: #{@specificHiddenTreasures}"
    end
    def substractVisibleTreasure(t)

    end
    def substractHiddenTreasure(t)

    end
    def adjustToFitTreasureLists(v, h)
      
    end
    def getMaxTreasures
      @@MAXTREASURES
    end
    def to_s
      s = "\nTexto: #{@text} \nLevels: #{@levels} \nNum of Visible Treasures: #{@nVisibleTreasures} \nNum of Hidden Treasures: #{@nHiddenTreasures} \nSpecific Visible Treasures: "
      s << @specificVisibleTreasures.join(', ')
      s << "\nSpecific Hidden Treasures: "
      s << @specificHiddenTreasures.join(', ')
      s << "\nDeath: #{@death}"

    end
    private_class_method :new

    
  end
end

