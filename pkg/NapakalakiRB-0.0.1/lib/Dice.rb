# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'

module NapakalakiGame
  
  class Dice
    include Singleton

    public
    def nextNumber
      Random.new.rand(1..6)
    end
  end
end

