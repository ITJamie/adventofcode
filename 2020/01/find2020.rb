# frozen_string_literal: true

numbers = []
File.open('list.txt').each { |line| numbers << line.to_i }

numbers2 = numbers

found_2020 = false
numbers.each do |first_num|
  next if found_2020

  numbers2.each do |second_num|
    next unless first_num + second_num == 2020

    puts 'found it'
    puts first_num.to_s + ' + ' + second_num.to_s
    found_2020 = true
    puts first_num * second_num
  end
end
puts ''
found_2020v2 = false
numbers.each do |first_num|
  next if found_2020v2

  numbers2.each do |second_num|
    numbers2.each do |third_num|
      next if found_2020v2
      next unless first_num + second_num + third_num == 2020

      puts 'found it'
      puts first_num.to_s + ' + ' + second_num.to_s + ' + ' + third_num.to_s
      found_2020v2 = true
      puts first_num * second_num * third_num
    end
  end
end
