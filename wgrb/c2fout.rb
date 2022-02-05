print "Hello. Please enter a Celsius value: "
celsius = gets.to_i
fahrenheit = (celsius * 9 / 5) + 32
puts "Saving result to output file 'temperature.out'"
fh = File.new("temperature.out", "w")
fh.puts fahrenheit
fh.close

