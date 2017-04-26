# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# enconding: UTF-8

require 'singleton'
require_relative 'Prize'
require_relative 'Monster'
require_relative 'BadConsequence'
require_relative 'Treasure'
require_relative 'TreasureKind'

module NapakalakiGame
  
  class CardDealer
    include Singleton
    
    def initialize
      @unusedTreasures = Array.new
      @unusedMonsters = Array.new
      @usedTreasures = Array.new
      @usedMonsters = Array.new
      @unusedCultist = Array.new
    end

    private
    
    #TODO Solucionar tesoros 0, 4, y 15 (UTF-8)
    def initTreasureCardDeck
      #Treasure[0]
      @unusedTreasures << Treasure.new("Si mi amor", 4, TreasureKind::ONEHAND)

      #Treasure[1]
      @unusedTreasures << Treasure.new("Botas de investigacion", 3, TreasureKind::SHOE)

      #Treasure[2]
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)

      #Treasure[3]
      @unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)

      #Treasure[4]
      @unusedTreasures << Treasure.new("Botas de lluvia acida", 1, TreasureKind::BOTHHANDS)

      #Treasure[5]
      @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)

      #Treasure[6]
      @unusedTreasures << Treasure.new("Ametralladora ACME", 4, TreasureKind::BOTHHANDS)

      #Treasure[7]
      @unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1, TreasureKind::ARMOR)

      #Treasure[8]
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)

      #Treasure[9]
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)

      #Treasure[10]
      @unusedTreasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET)

      #Treasure[11]
      @unusedTreasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND)

      #Treasure[12]
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)

      #Treasure[13]
      @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)

      #Treasure[14]
      @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)

      #Treasure[15]
      @unusedTreasures << Treasure.new("Escopeta de 3 caniones", 4, TreasureKind::BOTHHANDS)

      #Treasure[16]
      @unusedTreasures << Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND)

      #Treasure[17]
      @unusedTreasures << Treasure.new("La rebeca metalica", 2, TreasureKind::ARMOR)

      #Treasure[18]
      @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)

      #Treasure[19]
      @unusedTreasures << Treasure.new("Necro-comicon", 1, TreasureKind::ONEHAND)

      #Treasure[20]
      @unusedTreasures << Treasure.new("Nreconomicon", 5, TreasureKind::BOTHHANDS)

      #Treasure[21]
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)

      #Treasure[22]
      @unusedTreasures << Treasure.new("Necro-gnomicon", 2, TreasureKind::ONEHAND)

      #Treasure[23]
      @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)

      #Treasure[24]
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)

      #Treasure[25]
      @unusedTreasures << Treasure.new("Necro-playboycon", 3, TreasureKind::ONEHAND)

      #Treasure[26]
      @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)

      #Treasure[27]
      @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)

      #Treasure[28]
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)

      #Treasure[29]
      @unusedTreasures << Treasure.new("Tentaculo de pega", 2, TreasureKind::HELMET)

      #Treasure[30]
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOE)
    end
    
    #TODO Add levels against sectarians
    def initMonsterCardDeck
      #[0]
      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.",0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize, 0)

      #[1]
      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.", 0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.new("Tenochtitlan", 2, badConsequence, prize, 0)

      #[2]
      prize = Prize.new(1,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("El primodial bostezo contagioso. Pierdes el calzado visible.", 0, [TreasureKind::SHOE], [])
      @unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize, 0)

      #[3]
      prize = Prize.new(4, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      @unusedMonsters << Monster.new("Demonios de Magaluf", 2, badConsequence, prize, 0)

      #[4]
      prize = Prize.new(3, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles.", 0, 5, 0)
      @unusedMonsters << Monster.new("El gorron en el umbral", 13, badConsequence, prize, 0)

      #[5]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.",0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.new("H.P. Munchcraft", 6, badConsequence, prize, 0)

      #[6]
      prize = Prize.new(1, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible.", 0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.new("Necrofago", 13, badConsequence, prize, 0)

      #[7]
      prize = Prize.new(3, 2)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0)
      @unusedMonsters << Monster.new("El rey de rosado", 11, badConsequence, prize, 0)

      #[8]
      prize = Prize.new(1, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
      @unusedMonsters << Monster.new("Flecher", 2, badConsequence, prize, 0)

      #[9]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto.", true)
      @unusedMonsters << Monster.new("Los hondos", 8, badConsequence, prize, 0)

      #[10]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2)
      @unusedMonsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize, 0)
  
      #[11]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible.", 1, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize, 0)

      #[12]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
      @unusedMonsters << Monster.new("Pollipolipo volante", 3, badConsequence, prize, 0)

      #[13]
      prize = Prize.new(3, 1)
      badConsequence = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto.", true)
      @unusedMonsters << Monster.new("Yskhtihyssg-Goth", 14, badConsequence, prize, 0)

      #[14]
      prize = Prize.new(3, 1)
      badConsequence = BadConsequence.newDeath("La familia te atrapa. Estas muerto.", true)
      @unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize, 0)

      #[15]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2, [TreasureKind::BOTHHANDS], [])
      @unusedMonsters << Monster.new("Roboggoth", 8, badConsequence, prize, 0)

      #[16]
      prize = Prize.new(1, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 1, [TreasureKind::HELMET], [])
      @unusedMonsters << Monster.new("El espia sordo", 5, badConsequence, prize, 0)

      #[17]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
      @unusedMonsters << Monster.new("Tongue", 19, badConsequence, prize, 0)

      #[18]
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3, [TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new("Bicefalo", 21, badConsequence, prize, 0)

      #[19] -2 contra sectarios
      prize = Prize.new(3,1)
      badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes una mano visible", 0, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new("El mal indecible impronunciable", 10, badConsequence, prize, -2)

      #[20] +2 contra sectarios
      prize = Prize.new(2,1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes tus tesoros visibles. Jajaja.", 0, 5, 0)
      @unusedMonsters << Monster.new("Testigos oculares", 6, badConsequence, prize, 2)
      #[21] +4 contra sectarios
      prize = Prize.new(5, 2)
      badConsequence = BadConsequence.newDeath("Hoy no es tu dia de suerte. Mueres", true)
      @unusedMonsters << Monster.new("El gran cthulhu", 20, badConsequence, prize, 4)

      #[22] -2 contra sectarios
      prize = Prize.new(2, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Tu gobierno te recorta 2 niveles", 2, 0, 0)   
      @unusedMonsters << Monster.new("Serpiente Politico", 8, badConsequence, prize, -2)

      #[23] +5 contra sectarios
      prize = Prize.new(1, 1);
      badConsequence = BadConsequence.newLevelSpecificTreasures("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 0, [TreasureKind::HELMET, TreasureKind::ARMOR], [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS])
      @unusedMonsters << Monster.new("Felpuggoth", 2, badConsequence, prize, 5)

      #[24] -4 contra sectarios
      prize = Prize.new(4, 2);
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles", 2, 0, 0)
      @unusedMonsters << Monster.new("Shoggoth", 16, badConsequence, prize, -4)

      #[25] +3 contra sectarios
      prize = Prize.new(1, 1)
      badConsequence = BadConsequence.newLevelNumberOfTreasures("Pintalabios negro. Pierdes 2 niveles", 2, 0, 0)
      @unusedMonsters << Monster.new("Lolitagooth", 2, badConsequence, prize, 3)
    end
    
    def initCultistCardDeck
      #[1] +1 por cada sectario en juego 
      @unusedCultist << Cultist.new("Sectario", 1)
      
      #[2] +2 por cada sectario en juego
      @unusedCultist << Cultist.new("Sectario", 2)
    
      #[3] +1 por cada sectario en juego
      @unusedCultist << Cultist.new("Sectario", 1)
      
      #[4] +2 por cada sectario en juego
      @unusedCultist << Cultist.new("Sectario", 2)
      
      #[5] +1 por cada sectario en juego
      @unusedCultist << Cultist.new("Sectario", 1)
      
      #[6] +1 por cada sectario en juego
      @unusedCultist << Cultist.new("Sectario", 1)
      
    end
    
    def shuffleTreasures
      @unusedTreasures.shuffle!
    end
    
    def shuffleMonsters
      @unusedMonsters.shuffle!
    end
    
    def shuffleCultist
      @unusedCultist.shuffle!
    end

    
    public 
    def nextTreasure
      if @unusedTreasures.empty?
        @usedTreasures.each do |t|
          @unusedTreasures << t
          @usedTreasures.delete(t)
        end
        shuffleTreasures
      end
      
      @unusedTreasures.pop
      
    end
    
    def nextMonster
      if @unusedMonsters.empty?
        @usedMonters.each do |t|
          @unusedMonsters << t
          @usedMonsters.delete(t)
        end
        shuffleMonsters
      end
      
      @unusedMonsters.pop
    end
    
    def nextCultist
      @unusedCultist.pop
    end
    
    def giveTreasureBack (t)
      @usedTreasures << t
    end
    
    def giveMonsterBack (m)
      @usedMonsters << m
    end
    
    def initCards
      initTreasureCardDeck
      initMonsterCardDeck
      initCultistCardDeck
      shuffleTreasures
      shuffleMonsters
      shuffleCultist
    end
    
    def stats
      initMonsterCardDeck
      
      maxLevel = @unusedMonsters.collect{|t| t.level}.max
      
      validMonsters = @unusedMonsters.select{|t| t.level > maxLevel/2}
      
      puts "Este el nivel a partir del cual se muestran los monstruos: #{maxLevel/2}",validMonsters
    end
  end
end

