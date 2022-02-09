class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |str|
    raise NoSuchStrategyError unless str[1].length == 1 && str[1].downcase.match(/[rps]/)
  end
  players = Hash[0=>game[0][0], 1=>game[1][0]]
  chart = Hash["PR"=>0, "RP"=>1, "RS"=>0, "SR"=>1, "SP"=>0, "PS"=>1, "PP"=>0, "SS"=>0, "RR"=>0]
  #strat = Hash["P"=>"Paper", "R"=>"Rock", "S"=>"Scissor"]
  result = chart[game[0][1]+game[1][1]]
  #puts "#{players[result]} wins by using #{strat[game[result][1]]} against #{strat[game[1 - result][1]]}"
  return [players[result], game[result][1]]
end

def rps_tournament_winner(games)
  result = []
  while games.length > 0
    tmp = []
    games.each do |game|
      tmp << [rps_game_winner(game[0]), rps_game_winner(game[1])]
    end
    games = []
    if tmp.length == 1
      result = rps_game_winner(tmp[0])
    else
      i = 0
      while i < tmp.length
        games << [tmp[i], tmp[i+1]]
        i += 2
      end
    end
  end
  return result
end

#rps_game_winner([["Kristen", "R"], ["Pam", "P"]])
#rps_tournament_winner(
#  [[
#    [["Kristen", "P"], ["Dave", "S"]], 
#    [["Richard", "R"], ["Michael", "S"]],
#  ],
#  [
#    [["Allen", "S"], ["Omer", "P"]],
#    [["David E.", "R"], ["Richard X.", "P"]]
#  ]])

