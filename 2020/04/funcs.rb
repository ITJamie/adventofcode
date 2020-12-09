# frozen_string_literal: true

def cleanup_lines(test = false, raw = false)
  if raw == false
    raw = get_input(test).append('') # comes from ruby_shared
  end
  passports = []
  current_passport = 1
  current_passport_data = ''
  end_of_passport = false

  raw.each do |t|
    if t.strip == ''
      passports.append(current_passport_data)
      current_passport_data = ''
    else
      if current_passport_data == ''
        current_passport_data = t
      else
        current_passport_data += ' ' + t
        end
    end
  end
  passports
end

def attributeize(raw_passports)
  output = []
  raw_passports.each do |data|
    passport = {}
    lines = data.split(' ')
    lines.each do |raw_data|
      clean = raw_data.split(':')
      passport[clean[0]] = clean[1]
    end
    output.append(passport)
  end
  output
end

def check_for_keys(must_have, passports_parsed)
  valid = 0
  key_valid_passports = []
  passports_parsed.each do |passport|
    current_valid_passport = true
    must_have.each do |mh|
      current_valid_passport = false unless passport.key?(mh)
    end
    if current_valid_passport
      valid += 1
      key_valid_passports.append(passport)
    end
  end
  [valid, key_valid_passports]
end

def validate_key_data_byr(data)
  data.to_i.between?(1920, 2002)
end

def validate_key_data_eyr(data)
  data.to_i.between?(2020, 2030)
end

def validate_key_data_iyr(data)
  data.to_i.between?(2010, 2020)
end

def validate_key_data_hgt(data)
  if validate_key_data_hgt_string(data)[0]
    val = validate_key_data_hgt_string(data)[1]
    validate_key_data_hgt_num(val[:num], val[:mes])
  else
    false
  end
end

def validate_key_data_hgt_string(data)
  num = 0
  mes = ''
  if data.strip.include?('cm')
    mes = 'cm'
    num = data.split('cm')[0].to_i
  elsif data.strip.include?('in')
    mes = 'in'
    num = data.split('in')[0].to_i
  else
    return false, false
  end
  [true, { num: num, mes: mes }]
end

def validate_key_data_hgt_num(num, mes)
  if mes == 'cm'
    num.between?(150, 193)
  elsif mes == 'in'
    num.between?(59, 76)
  else
    false
  end
end

def validate_key_data_hcl(data)
  test1 = validate_key_data_hcl_hashcheck(data)
  test2 = validate_key_data_hcl_string_type(data)
  if test1 && test2
    true
  else
    false
  end
  end

def validate_key_data_hcl_hashcheck(data)
  chars = data.split(//)
  return false if chars[0] != '#'
  return false unless chars.count == 7

  true
end

def validate_key_data_hcl_string_type(data)
  chars = data.split(//)
  chars.delete_at(0)
  cleans = chars.join('')
  if cleans.match('^[[:alpha:]]+$')
    true
  elsif cleans.match('^[[:digit:]]+$')
    true
  elsif cleans.match('^[a-f0-9_.-]*$')
    true
  else
    false
  end
end

def validate_key_data_ecl(data)
  eyecolours = %(amb blu brn gry grn hzl oth)
  if eyecolours.include? data
    true
  else
    false
  end
end

def validate_key_data_pid(data)
  nums = data.split(//)
  nums.each do |_num|
    return false unless validate_key_data_pid_stringtype(data)
    if nums.count == 9
      return true
    else
      return false
    end
  end
end

def validate_key_data_pid_stringtype(data)
  nums = data.split(//)
  nums.each do |num|
    return false unless num.to_i.to_s == num
  end
  true
end

def validate_passport_data_stage2(s1_valid_passports)
  validated_passports = []
  s1_valid_passports.each do |passport|
    ap passport if $debug
    byr_test = validate_key_data_byr(passport['byr'])
    puts "byr_test: #{byr_test}" if $debug
    eyr_test = validate_key_data_eyr(passport['eyr'])
    puts "eyr_test: #{eyr_test}" if $debug
    iyr_test = validate_key_data_iyr(passport['iyr'])
    puts "iyr_test: #{iyr_test}" if $debug
    hgt_test = validate_key_data_hgt(passport['hgt'])
    puts "hgt_test: #{hgt_test}" if $debug
    hcl_test = validate_key_data_hcl(passport['hcl'])
    puts "hcl_test: #{hcl_test}" if $debug
    ecl_test = validate_key_data_ecl(passport['ecl'])
    puts "ecl_test: #{ecl_test}" if $debug
    pid_test = validate_key_data_pid(passport['pid'])
    puts "pid_test: #{pid_test}" if $debug
    puts '' if $debug
    if byr_test && eyr_test && iyr_test && hgt_test && hcl_test && ecl_test && pid_test
      validated_passports.append(passport)
    end
  end
  validated_passports
end
