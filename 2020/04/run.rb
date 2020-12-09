# frozen_string_literal: true

require_relative '../../ruby_shared/inputs.rb'
require_relative 'funcs.rb'
require 'awesome_print'

# ap cleanup_lines(true)
passports_parsed = attributeize(cleanup_lines(test = false))
# ap passports_parsed

must_have = %w[byr iyr eyr hgt hcl ecl pid]
$debug = false
puts 'stage1:'
valid_check = check_for_keys(must_have, passports_parsed)
puts "current valid passports: #{valid_check[0]}"
###############################################
###############################################
puts "\nstage2:"
ap valid_check[1]

ap validate_passport_data_stage2(valid_check[1])
ap validate_passport_data_stage2(valid_check[1]).count
