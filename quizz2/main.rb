require './lib'

def menu
  puts "Select the ordering parameter:"
  puts "1 - matricula"
  puts "2 - nome"
end

list = parse_list("engsoft.txt", "iso-8859-1")

option = 0
while true
  menu
  input = gets
  if is_a_number?(input)
    option = input.to_i
    if option < 1 || option > 2
      puts "Invalid option!"
    else
      break
    end
  end
end
if option == 1
  list = bubble_sort(list) do |x, y|
    x.matricula < y.matricula
  end
else
  list = bubble_sort(list) do |x, y|
    x.nome < y.nome
  end
end

output = File.open("output.txt", "w")
list.each do |a|
  line = a.matricula + "\t" + a.nome + "\n"
  output.write(line)
end
output.close()
