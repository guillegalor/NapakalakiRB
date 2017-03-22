# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  class Treasure
    attr_reader :bonus
    attr_reader :name
    attr_reader :type

    def initialize(n, bonus, t)
      @name = n
      @bonus = bonus
      @type = t
    end
    
    def to_s
      "\nName: #{@name} \nBonus: #{@bonus} \nType: #{@type}"
    end
  end
end

