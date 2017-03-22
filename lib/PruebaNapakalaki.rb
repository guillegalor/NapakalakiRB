# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Prize'
require_relative 'Monster'
require_relative 'TreasureKind'
require_relative 'Treasure'
require_relative 'BadConsequence'
require_relative 'Dice'
require_relative 'Player'
require_relative 'CardDealer'

module NapakalakiGame
  class PruebaNapakalaki
    dealer = CardDealer.instance
    
    dealer.stats
    
  end
end


