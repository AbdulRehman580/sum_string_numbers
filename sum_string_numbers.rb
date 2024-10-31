# sum_string_numbers.rb

def sum_string_numbers(input)
  return 0 if input.empty?

  input.split(",").map do |num|
    Integer(num.strip)
  end.sum
rescue ArgumentError
  raise ArgumentError, "Input contains non-numeric values"
end

# Testing function
def run_tests
  puts "Running Tests..."

  raise "Test failed: Empty string" unless sum_string_numbers("") == 0
  puts "Test passed: Empty string"
end

run_tests
