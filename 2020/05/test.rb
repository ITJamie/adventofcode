# frozen_string_literal: true

require_relative '../../ruby_shared/inputs.rb'
require_relative 'funcs.rb'
require 'awesome_print'

raw = get_input(true) # comes from ruby_shared

binarys = convert_lines_to_binarys(raw)

ap find_seat_ids(binarys)

def find_highest_seat(binarys)
  resp = find_seat_ids(binarys)
  highest_id = 0
  resp.each do |data|
    highest_id = data['seatid'] if data['seatid'] > highest_id
  end
  highest_id
end

puts "highest_id: #{find_highest_seat(binarys)}"
