# frozen_string_literal: true

require_relative '../../ruby_shared/inputs.rb'
require_relative 'funcs.rb'
require 'awesome_print'

passports_parsed = attributeize(cleanup_lines(true))

must_have = %w[byr iyr eyr hgt hcl ecl pid]

puts 'stage1:'
puts 'current valid passports: '
s1_valid_passports = check_for_keys(must_have, passports_parsed)
ap s1_valid_passports
###############################################
###############################################
puts "\nstage2:"
$debug = true

ap validate_passport_data_stage2(s1_valid_passports[1])
ap validate_passport_data_stage2(s1_valid_passports[1]).count

