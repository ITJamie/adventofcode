def get_input(test=false)
    filename =  if test
                    'input_test.txt'
                else
                    'input.txt'
                end
    return File.open(filename).readlines.map(&:chomp)
end

def cleanup_line_group_by_blank_line_with_space(test = false, raw = false)
    if raw == false
      raw = get_input(test).append('') # comes from ruby_shared
    end
    lines = []
    current_line = 1
    current_line_data = ''
    end_of_line = false
  
    raw.each do |t|
      if t.strip == ''
        lines.append(current_line_data)
        current_line_data = ''
      else
        if current_line_data == ''
          current_line_data = t
        else
          current_line_data += ' ' + t
          end
      end
    end
    lines
  end
  def cleanup_line_group_by_blank_line_without_space(test = false, raw = false)
    if raw == false
      raw = get_input(test).append('') # comes from ruby_shared
    end
    lines = []
    current_line = 1
    current_line_data = ''
    end_of_line = false
  
    raw.each do |t|
      if t.strip == ''
        lines.append(current_line_data)
        current_line_data = ''
      else
        if current_line_data == ''
          current_line_data = t
        else
          current_line_data += t
          end
      end
    end
    lines
  end