# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#TODO Eliminar esta clase y el metodo stats de CardDealer

require 'singleton'
require_relative 'CardDealer'

module Test
    class Examen
      include Singleton
      include NapakalakiGame
      
      def initialize
        @@contador = 0
      end
      
      #Metodos para contador
      def contabilizar
        @@contador += 1
      end
      def getContador
        @@contador
      end
      
      def principal
        contabilizar
        
        dealer = CardDealer.instance
        dealer.stats
        puts getContador
      end
    end
    
    Examen.instance.principal
end

  
