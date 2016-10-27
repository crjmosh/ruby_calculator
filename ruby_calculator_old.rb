# take first number
# take modifier
# take last number
# puts result
# error checking
# user input and modifiers should be checked for proper input type
# result should set first_number and allow for another modifier and last number so result continues to build until the user decides to clear the calculator
# - make + - * / work
# - make clear work

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
	puts "Type +, -, *, /"
	case gets.strip
	when "+"
		"+"
	when "-"
		"-"
	when "*"
		"*"
	when "/"
		"/"
	else
		puts "\nInvalid modifier, try again.\n\n"
		get_modifier
	end
end

def get_second_number(modifier)
	print "What is your second number? "
	second_number = gets.to_f
	puts "\nSecond number is: #{second_number}"
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

def continuing(first_answer)
	puts "\nLast answer was #{first_answer}, which modifier now?"
	puts "Enter +, -, *, /, or clear"
	new_modifier = gets.strip.downcase
	case new_modifier
	when "+", "-", "*", "/"
	when "clear"
		run_calculator
	else
		puts "Invalid modifier."
		continuing(first_answer)
	end
	print "\nEnter another number: "
	new_number = gets.to_f
	case new_modifier
	when "+"
		puts "#{first_answer} + #{new_number} = #{first_answer + new_number}"
		new_answer = first_answer + new_number
	when "-"
		puts "#{first_answer} - #{new_number} = #{first_answer + new_number}"
		new_answer = first_answer - new_number
	when "*"
		puts "#{first_answer} * #{new_number} = #{first_answer + new_number}"
		new_answer = first_answer * new_number
	when "/"
		puts "#{first_answer} / #{new_number} = #{first_answer + new_number}"
		new_answer = first_answer / new_number
	end
	continuing(new_answer)
end

def run_calculator
	while true
		main_menu
		first_number = get_first_number()
			modifier = get_modifier()
			second_number = get_second_number(modifier)
			continuing(calculate(first_number, modifier, second_number))
	end
end

run_calculator








