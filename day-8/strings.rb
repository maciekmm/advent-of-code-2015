#!/usr/bin/env ruby

inMemory=0
inCharacters=0
encInCharacters=0

while line = gets
	line = line.chomp
	inMemory += line.length
	inCharacters += eval(line).length
	encInCharacters += line.dump.length
end

puts "Part 1 #{inMemory-inCharacters}\nPart 2 #{encInCharacters-inMemory}"