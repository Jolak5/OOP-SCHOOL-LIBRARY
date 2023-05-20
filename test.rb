
require 'pry'
def calculate_sum(b)
  sum = a + b
  binding.pry
  sum
end

puts "Enter two numbers:"
num1 = gets.chomp.to_i
num2 = gets.chomp.to_i

result = calculate_sum(num1, num2)
puts "The sum is: #{result}"