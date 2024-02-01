require_relative('lib/game')

puts "bienvenue au morpion !"

puts "quel est le nom du joueur1"
joueur1 = gets.chomp.to_s
puts "et le joueur 2"
joueur2 = gets.chomp.to_s

my_game = Game.new(joueur1, joueur2)

puts "Début du jeu !"
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