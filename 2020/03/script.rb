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

def skiiii(right_incrementor, down_incrementor, lines, output = true)
  trees_hit = 0
  current_pos = 0
  current_down_count = down_incrementor # start from first position
  puts "right #{right_incrementor}, down #{down_incrementor}" if output
  lines.each do |line|
    if current_down_count == down_incrementor
      chars = line.split(//)
      if chars[current_pos] == '#'
        puts 'hit tree: ' + chars[current_pos] if output
        trees_hit += 1
      else
        puts 'WHEEEE: ' + chars[current_pos] if output
      end
      current_pos += right_incrementor
      current_down_count = 1
    else
      current_down_count += 1
    end
  end
  trees_hit
end

puts "answer 1: #{skiiii(3, 1, lines, false)}"

sets = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]
answers = []
sets.each do |set|
  trees = skiiii(set[0], set[1], lines, output = true)
  answers.append trees
  puts "trees hit: #{trees}"
  puts ''
end

multi = ''
answers.each do |n|
  multi = if multi == ''
            n
          else
            multi * n
          end
end
puts "answer 2: #{multi}"
