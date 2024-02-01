require_relative 'lib/game'

puts "Bienvenue au morpion !"
puts "Quel est le nom du joueur 1 :"
joueur1 = gets.chomp.to_s
puts "Et le joueur 2 :"
joueur2 = gets.chomp.to_s
compteur = 0
loop do
    compteur = compteur +1
    my_game = Game.new(joueur1, joueur2)

  puts "Début du jeu ! Partie n° #{compteur}"
  gets.chomp

  loop do
    system('clear')
    my_game.afficher_grille
    if my_game.joue
      if my_game.win_condition
        system('clear')
        my_game.afficher_grille
        my_game.fin(my_game.tour_joueur == 'X' ? joueur1 : joueur2)
        break
      elsif !my_game.is_going
        system('clear')
        my_game.afficher_grille
        puts "Le jeu se termine par un match nul."
        break
      end
      my_game.changer_joueur
    end
  end

  puts "Voulez-vous rejouer ? (oui/non)"
  choix = gets.chomp.downcase
  break unless choix == 'oui' || choix == 'o'
end