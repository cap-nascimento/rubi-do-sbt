# classe para aluno
class Aluno
  def initialize(matricula, nome)
    @matricula = matricula
    @nome = nome
  end

  def matricula
    @matricula
  end

  def nome
    @nome
  end
end

# funções com regex
def alpha_only?(str)
  !!(str =~ /[a-zA-Z]/)
end

def is_a_number?(str)
  !!(str =~ /[0-9]/)
end

# funções para ordenação
# mergesort ruim
=begin
def merge(v1, v2)
  v = []
  i = 0
  j = 0
  while(i < v1.length && j < v2.length)
    if yield(v1[i], v2[j])
      v << v1[i]
      i += 1
    else
      v << v2[j]
      j += 1
    end
  end

  while(i < v1.length)
    v << v1[i]
    i += 1
  end

  while(j < v2.length)
    v << v2[j]
    j += 1
  end
  return v
end

def merge_sort(arr)
  v = []
  if arr.length > 1
    mid = arr.length / 2
    a = merge_sort(arr.take(mid)) do |x, y|
      yield(x, y)
    end
    b = merge_sort(arr.drop(arr.length - mid)) do |x, y|
      yield(x, y)
    end
    v = merge(a, b) do |x, y|
      yield(x, y)
    end
  else
    v = arr
  end
  return v
end
=end

def bubble_sort(arr)
  i = 0
  while(i < arr.length)
    j = 0
    while(j < arr.length-1)
      if !yield(arr[j], arr[j+1])
        arr[j], arr[j+1] = arr[j+1], arr[j]
      end
      j += 1
    end
    i+=1
  end
  return arr
end

# funções de parsing
def parse_list(filename, encoding)
  lista = File.read(filename, :encoding => encoding)
  arr = lista.split('/')
  alunos = []
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
      matricula = cur_arr[cur_arr.length-1] + "/" + nxt_arr[0]
      nome = name.join(" ")
      alunos << Aluno.new(matricula, nome)
    end
    idx += 1
  end
  return alunos
end
