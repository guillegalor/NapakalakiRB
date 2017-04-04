# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

module NapakalakiGame

  class Napakalaki
    include Singleton
    
    def initialize
      @currentPlayer = nil
      @players = Array.new
      @dealer = CardDealer.instance
      @currentMonster = nil
    end
    
    
    private
    def initPlayers(names)
      names.each{|n| @players << Player.new(n)}
    end
    
    def nextPlayer
      if @currentPlayer == nil
        @currentPlayer = @players.sample 
      else
        index = @players.index(@currentPlayer)
        if index == @players.length-1
          index = 0
        else
          index += 1
        end
        @currentPlayer = @players[index]
      end
    end
    
    def nextTurnAllowed
      (@currentPlayer == nil) || @currentPlayer.validState
    end
    
    def setEnemies
      @players.each do |t|
        loop do
          enemy = @players.sample
          break if t != enemy
        end
        t.setEnemy(enemy)  
      end
    end

    
    public
    #TODO Preguntar si hay que poner combatResult = ...
    def developCombat
      @currentPlayer.combat @currentMonster
    end
    
    def discardVisibleTreasures(*treasures)
      treasures.each do |t|
        treasure = t
        @currentPlayer.discardVisibleTreasure(treasure)
        @dealer.giveTreasureBack(treasure)
      end
    end
    
    def discardHiddenTreasures(*treasures)

    end
    
    def makeTreasuresVisible(*treasures)
      treasures.each do |t|
        @currentPlayer.makeTreasureVisible t
      end
    end
    
    def initGame(players)
      initPlayers players
      setEnemies
      @dealer.initCards
      nextTurn
    end
    
    def getCurrentPlayer
      @currentPlayer
    end
    
    def getCurrentMonster
      @currentMonster
    end
    
    def nextTurn
      stateOK = nextTurnAllowed
      if stateOK
        @currentMonster = @dealer.nextMonster
        @currentPlayer = nextPlayer
        dead = @currentPlayer.isDead
        
        if dead
          @currentPlayer.initTreasures  
        end
        
      end
      
      stateOK
    end
    
    def endOfGame(result)
      result == CombatResult::WINGAME
    end
  end
end