str =  "Hello world"
puts str
str.index("world")

(0..10).each { |i|  puts "pedrorijo91" }

def randomGuess(max)
	n = rand(max)
	puts "n is #{n}"
	guess = -1
	while guess != n
		puts 'make your guess'
		guess = gets().to_i
		if guess != n
			puts guess > n ? "lower!" : "higher!"
		end
	end
	puts "you have guessed the number !" unless guess != n
end

randomGuess(10)