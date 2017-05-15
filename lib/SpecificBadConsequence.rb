# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  class SpecificBadConsequence < BadConsequence
    
    def initialize (t, l, v, h)
      super(t,l)
      @specificVisibleTreasures = v
      @specificHiddenTreasures = h      
    end
    
    def isEmpty
      @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?
    end
    
    def substractVisibleTreasure (t)
      if @specificVisibleTreasures.include?(t.type)
        @specificVisibleTreasures.delete_at(@specificVisibleTreasures.index(t.type))
      end
    end
    
    def substractHiddenTreasure (t)
      if @specificHiddenTreasures.include?(t.type)
        @specificHiddenTreasures.delete_at(@specificHiddenTreasures.index(t.type))
      end
    end
    
    def adjustToFitTreasureLists (v, h)
      unless isEmpty    
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
        
        SpecificBadConsequence.new(@text, @levels, specificVisibleTreasures, specificHiddenTreasures)
        
      else
        
        SpecificBadConsequence.new(@text, @levels, [], [])
      
      end 
    end
  
    def to_s
      s = "\nText: #{@text} \nLevels: #{@levels} \nSpecific Visible Treasures: "
      s << @specificVisibleTreasures.join(', ')
      s << "\nSpecific Hidden Treasures: "
      s << @specificHiddenTreasures.join(', ')
    end
  end
end
