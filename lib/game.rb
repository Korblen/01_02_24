require 'pry'
class Game
    attr_accessor :tableau, :joueur1, :joueur2

    def initialize(joueur1, joueur2)
        @tableau = [[' ', ' ', ' '],[' ', ' ', ' '],[' ', ' ', ' ']]
        @tour_joueur = 'X'
        @joueur1 = joueur1
        @joueur2 = joueur2
        puts "#{@joueur1} joue les X, #{@joueur2} joue les O"
    end

    def joue
        puts "Veuillez entrer les coordonnées (par exemple, 'A1', 'B2', 'C3') :"
        omg_c_dur = gets.chomp.upcase
        choix = omg_c_dur.split('')
      
        colonne = case choix[0]
        when 'A' then 0
        when 'B' then 1
        when 'C' then 2
            else
            puts "Choix de colonne incorrect, veuillez entrer A, B ou C."
            return false
        end
      
        ligne = choix[1].to_i - 1
      
        if ligne < 0 || ligne > 2
          puts "Choix de ligne incorrect, veuillez entrer 1, 2 ou 3."
          return false
        end
      
        if tableau[ligne][colonne] != ' '
          puts "La case est déjà occupée. Veuillez choisir une autre case."
          return false
        end
      
        tableau[ligne][colonne] = @tour_joueur
        return true
    end
   
    def afficher_grille
      puts "   A   B   C"
      @tableau.each_with_index do |ligne, index|
        print "#{index + 1} "
        ligne.each_with_index do |casee, col_index|
          print "| #{casee} "
        end
        puts "|"
        puts "  |---|---|---|" if index < 2
      end
    end

    def is_going
        @tableau.each do |lignes|
            lignes.each do |casee|
            if casee == ' '
                return true
            end
            end
        end
        if win_condition == true
            return true
        end
        return false
    end

    def win_condition
        v = @tableau[0]
        p = @tableau[1]
        n = @tableau[2]
        @tableau.each do |ligne|
            if ligne[0] != ' ' && ligne[0] == ligne[1] && ligne[0] == ligne[2]
              return true
            end
        end

        (0..2).each do |colonne|
            if @tableau[0][colonne] != ' ' && @tableau[0][colonne] == @tableau[1][colonne] && @tableau[0][colonne] == @tableau[2][colonne]
              return true
            end
        end

        if @tableau[0][0] != ' ' && @tableau[0][0] == @tableau[1][1] && @tableau[0][0] == @tableau[2][2]
            return true
          end
          if @tableau[0][2] != ' ' && @tableau[0][2] == @tableau[1][1] && @tableau[0][2] == @tableau[2][0]
            return true
        end
        return false
    end

    def tour_joueur
        @tour_joueur
      end
    
      def changer_joueur
        @tour_joueur = (@tour_joueur == 'X') ? 'O' : 'X'
        if @tour_joueur == 'X'
            puts "tour de #{joueur1}"
        else
            puts "tour de #{joueur2}"
        end
        gets.chomp
      end
    
    def fin(joueur)
        puts "#{joueur} remporte la victoire !"
    end
end