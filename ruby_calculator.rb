def main_menu
	puts "\nRuby Calculator"
	puts "Start a calculation or type 'quit' to exit."
end

def get_first_number
	print "What is your first number? "
	first_number = gets.strip.downcase
	exit if first_number == "quit"
	first_number = first_number.to_f
	puts "\nFirst number is: #{first_number}\n\n"
	first_number
end

def get_modifier
	puts "Which modifier?"
	puts "Type +, -, *, /, or clear"
	case gets.strip
	when "+"
		"+"
	when "-"
		"-"
	when "*"
		"*"
	when "/"
		"/"
	when "clear"
		"end loop"
	else
		puts "\nInvalid modifier, try again.\n\n"
		get_modifier
	end
end

def get_second_number(modifier)
	print "What is your next number? "
	second_number = gets.to_f
	puts "\nNext number is: #{second_number}"
	if modifier == "/" && second_number == 0
		puts "\nCannot divide by zero, you fool.\n"
		get_second_number(modifier)
	else
		second_number
	end
end

def calculate(first, modifier, second)
	case modifier
	when "+"
		puts "\n#{first} #{modifier} #{second} = #{first + second}"
		first + second
	when "-"
		puts "\n#{first} #{modifier} #{second} = #{first - second}"
		first - second
	when "*"
		puts "\n#{first} #{modifier} #{second} = #{first * second}"
		first * second
	when "/"
		puts "\n#{first} #{modifier} #{second} = #{first / second}"
		first / second
	else
		print "\nError.\n\n"
	end
end


	while true
		main_menu
		first_number = get_first_number()
		multiple_calc = true
		while multiple_calc
			modifier = get_modifier()
			if modifier == "end loop"
				multiple_calc = false
			else
				second_number = get_second_number(modifier)
				first_number = calculate(first_number, modifier, second_number)
			end
		end
	end