# frozen_string_literal: true

lines = []
File.open('input.txt').each do |line|
  i = 0
  ii = 300
  line = line.split("\n")[0]
  new_line = line
  while i < ii
    new_line += line
    i += 1
  end
  lines << new_line
end

trees_hit = 0
current_pos = 0
right_incrementor = 3
down_incrementor = 1

lines.each do |line|
  chars = line.split(//)
  if chars[current_pos] == '#'
    puts 'hit tree: ' + chars[current_pos]
    trees_hit += 1
  else
    puts 'WHEEEE: ' + chars[current_pos]
  end
  current_pos += right_incrementor
end

puts 'trees hit:'
puts trees_hit
