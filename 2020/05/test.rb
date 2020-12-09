# frozen_string_literal: true

require_relative '../../ruby_shared/inputs.rb'
require_relative 'funcs.rb'
require 'awesome_print'

raw = get_input(true) # comes from ruby_shared

binarys = convert_lines_to_binarys(raw)

ap find_seat_ids(binarys)

puts "highest_id: #{find_highest_seat(binarys)}"

allseats = [119,567,820,922]
used_seats = []
binarys.each do |seat_check|
    used_seats.append(seat_check['seatid'])
end

puts "unused seats:"
ap allseats - used_seats 

