# sum_string_numbers.rb

def sum_string_numbers(input)
  return 0 if input.empty?

  input.split(/,|\n/).map do |num|
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

  raise "Test failed: Single number '1'" unless sum_string_numbers("1") == 1
  puts "Test passed: Single number '1'"

  raise "Test failed: Multiple numbers '1,2,3'" unless sum_string_numbers("1,2,3") == 6
  puts "Test passed: Multiple numbers '1,2,3'"

  raise "Test failed: Numbers with new lines '1\n2, 3'" unless sum_string_numbers("1\n2, 3") == 6
  puts "Test passed: Numbers new lines '1\n2, 3'"
end

run_tests
