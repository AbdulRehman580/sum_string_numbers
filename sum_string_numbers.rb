# sum_string_numbers.rb

def sum_string_numbers(input)
  return 0 if input.empty?

  # Check for custom delimiter at the beginning of the string
  if input.start_with?("//")
    delimiter_line, numbers = input.split("\n", 2)
    delimiter = delimiter_line[2..-1]  # Extract the delimiter after "//"
  else
    delimiter = /,|\n/  # Default delimiter: comma or newline
    numbers = input
  end

  # Convert and validate numbers
  parsed_numbers = numbers.split(delimiter).map do |num|
    Integer(num.strip)
  end

  # Check for negative numbers
  negatives = parsed_numbers.select { |num| num < 0 }
  unless negatives.empty?
    raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}"
  end

  parsed_numbers.sum
rescue ArgumentError => e
  raise e if e.message.include?("Negative numbers not allowed")
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

  raise "Test failed: Numbers with different delimiter '//;\n1;2'" unless sum_string_numbers("//;\n1;2") == 3
  puts "Test passed: Numbers with different delimiter '//;\n1;2'"

  begin
    sum_string_numbers("1,-2,3")
    raise "Test failed: Negative number '-2' should raise an exception"
  rescue ArgumentError => e
    raise "Test failed: Unexpected error message: #{e.message}" unless e.message == "Negative numbers not allowed: -2"
    puts "Test passed: Negative number '-2' raises exception"
  end

  # Test case for multiple negative numbers
  begin
    sum_string_numbers("1,-2,-3,4")
    raise "Test failed: Negative numbers '-2, -3' should raise an exception"
  rescue ArgumentError => e
    raise "Test failed: Unexpected error message: #{e.message}" unless e.message == "Negative numbers not allowed: -2, -3"
    puts "Test passed: Multiple negative numbers '-2, -3' raise exception"
  end
end

run_tests
