def alpha_only?(str)
  !!(str =~ /[a-zA-Z]/)
end

filename = "engsoft.txt"
lista = File.read(filename, :encoding => "iso-8859-1")
arr = lista.split('/')

lista_parsed = File.open("output.txt", "w")
idx = 0
while (idx < arr.length-1)
  cur = arr[idx]
  nxt = arr[idx+1]
  cur_arr = cur.split
  nxt_arr = nxt.split
  name = []
  if nxt_arr[0].length == 7
    nxt_arr[1..-1].each do |str|
      break if !alpha_only?(str)
      name << str
    end
    line = cur_arr[cur_arr.length-1] + "/" + nxt_arr[0] + "\t" + name.join(" ") + "\n"
    lista_parsed.write(line)
  end
  idx += 1
end
lista_parsed.close()
