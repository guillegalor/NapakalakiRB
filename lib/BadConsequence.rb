# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Player'

module NapakalakiGame
  
  class BadConsequence
    @@MAXTREASURES = 10
    attr_reader :nVisibleTreasures
    attr_reader :nHiddenTreasures
    attr_reader :specificVisibleTreasures
    attr_reader :specificHiddenTreasures

    def initialize (text, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
      @text = text
      @levels = someLevels
      @nVisibleTreasures = someVisibleTreasures.to_i
      @nHiddenTreasures = someHiddenTreasures.to_i
      @specificVisibleTreasures = someSpecificVisibleTreasures.to_a
      @specificHiddenTreasures = someSpecificHiddenTreasures.to_a
      @death = death
    end

    public
    def getLevels
      @levels
    end
    
    def isEmpty
      (@nVisibleTreasures == 0) && (@nHiddenTreasures == 0) && @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
    end
    
    def self.newLevelNumberOfTreasures (t, l, nVisible, nHidden)
      new(t, l, nVisible, nHidden, nil, nil, false)
    end
    
    def self.newLevelSpecificTreasures (t, l, v, h)
      new(t, l, nil, nil, v, h, false)
    end
    
    def self.newDeath (t, death)
      if death
        new(t, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES, nil, nil, death)
      else
        new(t, nil, nil, nil, nil, nil, death)
      end
    end
    
    def substractVisibleTreasure (t)
      if !isEmpty
        if !@specificVisibleTreasures.empty?
          @specificVisibleTreasures.delete t.type
        else
          @nVisibleTreasures = [0, @nVisibleTreasures -1].max
        end
      end
    end
      
    def substractHiddenTreasure (t)
      if !isEmpty
        if !@specificHiddenTreasures.empty?
          @specificHiddenTreasures.delete t.type
        else
          @nHiddenTreasures = [0, @nHiddenTreasures -1].max
        end
      end
    end
    
    def adjustToFitTreasureLists (v, h)
      if !isEmpty
        nVisibleTreasures = [@nVisibleTreasures, v.size].min
        nHiddenTreasures = [@nHiddenTreasures, h.size].min
        
        visibleTypes = v.collect { |t| t.type }
        hiddenTypes = h.collect { |t| t.type}
        specificVisibleTreasures = Array.new
        cpySpecificVisibleTreasures = @specificVisibleTreasures.dup
        specificHiddenTreasures = Array.new
        cpySpecificHiddenTreasures = @specificHiddenTreasures.dup
        
        visibleTypes.each do |t|
          if cpySpecificVisibleTreasures.include?(t)
            specificVisibleTreasures << t
            cpySpecificVisibleTreasures.delete_at(cpySpecificVisibleTreasures.index(t).to_i)
          end
        end
        hiddenTypes.each do |t|
          if cpySpecificHiddenTreasures.include?(t)
            specificHiddenTreasures << t
            cpySpecificHiddenTreasures.delete_at(cpySpecificVisibleTreasures.index(t).to_i)
          end
        end
        
        if specificHiddenTreasures.empty? && specificVisibleTreasures.empty?
          BadConsequence.newLevelNumberOfTreasures @text, @levels, nVisibleTreasures, nHiddenTreasures
        else
          BadConsequence.newLevelSpecificTreasures @text, @levels, specificVisibleTreasures, specificHiddenTreasures
        end
        
      else
        self.dup
      end
      
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

