# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Dice'
require_relative 'CombatResult'

module NapakalakiGame

  class Player
    #TODO Pensar si usar la variable como instancia de clase o como variable de clase
    @@MAXLEVEL = 3
    
    def self.MAXLEVEL
      @@MAXLEVEL
    end
    
    
    def initialize (name)
      @name = name
      @level = 1
      @dead = true
      @canISteal = true
      @pendingBadConsequence = nil
      @enemy = nil
      @visibleTreasures = Array.new
      @hiddenTreasures = Array.new
    end

    private 
    def bringToLife
      @dead = false
    end
    
    def incrementLevels (l)
      @level = [@level + l, 10].min if l >= 0
    end  
    
    def decrementLevels (l)
      @level = [@level - l, 1].max if l >= 0
    end
    
    def setPendingBadConsequence (b)
      @pendingBadConsequence = b
    end
    
    def applyPrize (m)
      nLevels = m.getLevelsGained
      incrementLevels(nLevels)
      
      nTreasures = m.getTreasuresGained
      if nTreasures > 0
        dealer = CardDealer.instance
        nTreasures.times do
          treasure = dealer.nextTreasure
          @hiddenTreasures << treasure
        end
      end
    end
    
    def applyBadConsequence (m)
      badConsequence = m.getBadConsequence
      
      nLevels = badConsequence.getLevels
      decrementLevels(nLevels)
      
      pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)
    end
    
    #Funcion que comprueba si se puede añadir un tesoro a la lista de tesoros visibles
    def canMakeTreasureVisible (t)
      hash = {
        :hands => howManyVisibleTreasures(TreasureKind::ONEHAND) + 2*howManyVisibleTreasures(TreasureKind::BOTHHANDS), 
        TreasureKind::HELMET => howManyVisibleTreasures(TreasureKind::HELMET), 
        TreasureKind::ARMOR => howManyVisibleTreasures(TreasureKind::ARMOR), 
        TreasureKind::SHOE => howManyVisibleTreasures(TreasureKind::SHOE) 
      }
              
      if t.type == TreasureKind::ONEHAND
        (0..1) === hash[:hands]
      elsif t.type == TreasureKind::BOTHHANDS
        hash[:hands] == 0
      else
        hash[t.type] == 0
      end
    end
    
    def howManyVisibleTreasures (tKind)
      n = 0
      @visibleTreasures.each do |t|
        n += 1 if t.type == tKind  
      end
      n
    end
    
    def haveStolen
      @canISteal = false
    end
    
    def dieIfNoTreasures
      @dead = true
    end

    
    public
    def isDead
      @dead
    end
    
    def getHiddenTreasures
      @hiddenTreasures
    end
  
    def getVisibleTreasures
      @visibleTreasures
    end
    
    def combat (m)
      myLevel = getCombatLevel
      monsterLevel = m.getCombatLevel
      
      if !canISteal
        dice = Dice.instance
        number = dice.nextNumber
        
        if number < 3
          enemyLevel = @enemy.getCombatLevel
          monsterLevel += enemyLevel
        end
      end
      
      if myLevel > monsterLevel
        applyPrize(m)
        if @level >= @@MAXLEVEL
          combatResult = CombatResult::WINGAME
        else
          combatResult = CombatResult::WIN
        end
      else
        applyBadConsequence(m)
        combatResult = CombatResult::LOSE
      end
      
      combatResult
    end
    
    def makeTreasureVisible (t)
      canI = canMakeTreasureVisible(t)
      if canI
        @visibleTreasures << t
        @hiddenTreasures.delete(t)
      end
    end
    
    def discardVisibleTreasure (t)
      @visibleTreasures.delete(t)
      
      if (@pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty)
        @pendingBadConsequence.substractVisibleTreasure(t) 
      end
      
      dieIfNoTreasures
      
    end
    
    def discardHiddenTreasure (t)
      @hiddenTreasures.delete(t)
      
      if (@pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty)
        @pendingBadConsequence.substractHiddenTreasure(t)
      end
      
      dieIfNoTreasures
    end
    
    def validState
      @hiddenTreasures.length <= 4 && (@pendingBadConsequence == nil || @pendingBadConsequence.isEmpty)
    end
    
    def initTreasures
      dealer = CardDealer.instance
      dice = Dice.instance
      
      bringToLife
      
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
      
      number = dice.nextNumber
      if number > 1
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
      
      if number == 6
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
    end
    
    def getLevels
      @level
    end
    
    #TODO Comprobar que la variable treasure se puede usar fuera del if
    def stealTreasure
      canI = canISteal
      if canI
        canYou = @enemy.canYouGiveMeATreasure
        if canYou
          treasure = @enemy.giveMeATreasure
          @hiddenTreasures << treasure
          haveStolen
        end
      end
      treasure
    end
    
    def setEnemy (enemy)
      @enemy = enemy
    end
    
    def canISteal
      @canISteal
    end
    
    def discardAllTreasures
      cpyVisible = @visibleTreasures.dup
      cpyHidden = @hiddenTreasures.dup
      
      cpyVisible.each { |t| discardVisibleTreasure t }
      cpyHidden.each { |t| discardHiddenTreasure t }
    end
    
    def to_s
      "#{@name} \nLevel: #{@level} \nCombat level: #{getCombatLevel}"
    end
    
    #Definimos este metodo para no entrar en un bucle al mostrar el "enemy", que es otro player que tiene su enemy...
    def getState
      s = "Name: #{@name} \nLevel: #{@level} \nVisible Treasures: "
      s.concat(@visibleTreasures.collect{|t| t.name}.join(', '))
      s.concat("\nHidden Treasures: ")
      s.concat(@hiddenTreasures.collect{|t| t.name}.join(', '))
      s.concat("\nPending Bad Consequence: #{@pendingBadConsequence} \nEnemy: #{@enemy} \nCan I Steal? #{@canISteal} \nDead: #{@dead}")
    end
    
    
    protected
     #TODO Preguntar si hay que sacar dicho tesoro de @hiddenTreasures y si no habria que hacer el metodo publico
    def canYouGiveMeATreasure
      !@hiddenTreasures.empty?
    end
    
    def giveMeATreasure
      treasure = @hiddenTreasures.sample
      discardHiddenTreasure(treasure)
      treasure
    end
    
    def getCombatLevel
      combatLevel = @level
      @visibleTreasures.each do |t|
        combatLevel += t.bonus
      end
      combatLevel
    end
  end
end