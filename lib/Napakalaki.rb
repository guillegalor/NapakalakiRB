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
    
    #TODO Poner privado
    public
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
    def developCombat

    end
    def discardVisibleTreasures(treasures)

    end
    def discardHiddenTreasures(treasures)

    end
    def makeTreasuresVisible(treasures)

    end
    def initGame(players)

    end
    def getCurrentPlayer
      @currentPlayer
    end
    def getCurrentMonster
      @currentMonster
    end
    def nextTurn

    end
    def endOfGame(result)
      result == CombatResult::WINGAME
    end
  end
end