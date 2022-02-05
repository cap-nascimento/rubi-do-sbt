puts "Reading Fahrenheit temperature value from data file..."
num = File.read("temperature.dat")
fahrenheit = num.to_i
celsius = ((fahrenheit - 32) * 5) / 9
puts "Writing result into 'temperature.out'"
output = File.new("temperature.out", "w")
output.puts celsius
output.close
