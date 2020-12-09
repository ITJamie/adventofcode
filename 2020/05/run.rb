# frozen_string_literal: true

require_relative '../../ruby_shared/inputs.rb'
require_relative 'funcs.rb'
require 'awesome_print'

raw = get_input(false) # comes from ruby_shared

binarys = convert_lines_to_binarys(raw)

ap find_seat_ids(binarys)

resp = find_seat_ids(binarys)
highest_id = 0
resp.each do |data|
  highest_id = data['seatid'] if data['seatid'] > highest_id
end
puts "highest_id: #{highest_id}"

allseats = [*1..989]
used_seats = []
binarys.each do |seat_check|
  used_seats.append(seat_check['seatid'])
end

puts 'unused seats:'
ap allseats - used_seats
