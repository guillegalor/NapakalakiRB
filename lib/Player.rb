# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame

  class Player
    
    def initialize(name)
      @name = name
      @level = 1
      @dead = true
      @canISteal = true
      @pendingBadConsequence = nil
      @visibleTreasures = Array.new
      @hiddenTreasures = Array.new
    end

    private 
    def bringToLife()
      @dead = false
    end
    def getCombatLevel()
      combatLevel = @level
      @visibleTreasures.each do |t|
        combatLevel += t.bonus
      end
      combatLevel
    end
    def incrementLevels(l)
      @level = [@level + l, 10].min if l >= 0
    end  
    def decrementLevels(l)
      @level = [@level - l, 1].max if l >= 0
    end
    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end
    def applyPrize(m)

    end
    def applyBadConsequence(m)

    end
    def canMakeTreasureVisible(t)
      
    end
    def howManyVisibleTreasures(tKind)
      n = 0
      @visibleTreasures.each do |t|
        n += 1 if t.type() == tKind  
      end
      n
    end
    def dieIfNoTreasures()
      @dead = true
    end
    def giveMeATreasure

    end
    def canYouGiveMeATreasure
      !@hiddenTreasures.empty?
    end
    def haveStolen
      @canISteal = false
    end

    public
    def isDead()
      @dead
    end
    def getHiddenTreasures
      @hiddenTreasures
    end
    def getVisibleTreasures
      @visibleTreasures
    end
    def combat(m)

    end
    def makeTreasureVisible(t)

    end
    def discardVisibleTreasure(t)

    end
    def discardHiddenTreasure(t)

    end
    def validState
      @hiddenTreasures.length <= 4 && @pendingBadConsequence.isEmpty
    end
    def initTreasures

    end
    def getLevels
      @level
    end
    def stealTreasure

    end
    def setEnemy(enemy)
      @enemy = enemy
    end
    def canISteal
      @canISteal
    end
    def discardAllTreasures

    end
    def to_s
      @name
    end
    #Definimos este metodo para no entrar en un bucle al mostrar el "enemy", que es otro player que tiene su enemy...
    def getState
      s = "Name: #{@name} \nLevel: #{@level} \nVisible Treasures: "
      s.concat(@visibleTreasures.collect{|t| t.name}.join(', '))
      s.concat("\nHidden Treasures: ")
      s.concat(@hiddenTreasures.collect{|t| t.name}.join(', '))
      s.concat("\nPending Bad Consequence: #{@pendingBadConsequence} \nEnemy: #{@enemy} \nCan I Steal? #{@canISteal} \nDead: #{@dead}")
    end


  end
end