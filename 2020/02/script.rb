# frozen_string_literal: true

lines = []
File.open('input.txt').each { |line| lines << line.to_s }

passwords = {}

lines.each_with_index do |line, index|
  password_split = line.split(': ')
  passwords[index] = { rule: { raw: password_split[0] }, password: password_split[1].split("\n")[0] }
end

def parse_policy(raw_rule)
  ret = {}
  space_split = raw_rule.split(' ')
  ret['char'] = space_split[1]
  dash_split = space_split[0].split('-')
  ret['min'] = dash_split[0]
  ret['max'] = dash_split[1]
  ret
end

def rule_checkv1(password_to_check, req_char, min_count, max_count)
  chars_raw = password_to_check.split(//)
  chars_counted = {}
  chars_raw.each do |char|
    chars_counted[char] = if chars_counted.key?(char)
                            chars_counted[char] + 1
                          else
                            1
                          end
  end
  #   puts chars_counted
  #   puts req_char
  #   puts min_count
  #   puts max_count
  if chars_counted.key?(req_char)
    if chars_counted[req_char] >= min_count.to_i
      chars_counted[req_char] <= max_count.to_i
    else
      false
    end
  else
    false
  end
end

passed = 0

passwords.each do |index, passwordh|
  rules = parse_policy(passwords[index][:rule][:raw])
  passwords[index][:rule][:parsed] = rules
  valid_pass = rule_checkv1(passwordh[:password], rules['char'], rules['min'], rules['max'])
  passed += 1 if valid_pass
  #   puts valid_pass
  #   puts ''
end

puts 'passed method one'
puts passed
puts ''
def rule_checkv2(password_to_check, req_char, pos1, pos2)
  chars_raw = password_to_check.split(//)

  pos1 = pos1.to_i - 1
  pos2 = pos2.to_i - 1
  pos1_status = chars_raw[pos1] == req_char
  pos2_status = chars_raw[pos2] == req_char
  if pos1_status
    if pos2_status
      false
    else
      true
    end
  else
    if pos2_status
      true
    else
      false
    end
  end
end
passed = 0
passwords.each do |index, passwordh|
  rules = parse_policy(passwords[index][:rule][:raw])
  passwords[index][:rule][:parsed] = rules
  valid_pass = rule_checkv2(passwordh[:password], rules['char'], rules['min'], rules['max'])
  passed += 1 if valid_pass
end

puts "passed by method two"
puts passed

