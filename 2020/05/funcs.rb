# frozen_string_literal: true

def convert_lines_to_binarys(lines)
  binarys = []
  lines.each do |st|
    replacements = {
      'B' => '1', 'F' => '0',
      'R' => '1', 'L' => '0'
    }
    binned = st.gsub(Regexp.union(replacements.keys), replacements)
    binarys.append({ 'alpha' => st, 'binary' => binned })
  end
  binarys
end

def find_row(data)
  row_binary = data[0, 7]
  row_binary.to_i(2)
end

def find_col(data)
  row_binary = data[7, 9]
  row_binary.to_i(2)
end

def find_seat_ids(arrays)
  new_binary = []
  arrays.each_with_index do |data, _i|
    data['row'] = find_row(data['binary'])
    data['col'] = find_col(data['binary'])
    data['seatid'] = (data['row'] * 8) + data['col']
    new_binary.append(data)
  end
  new_binary
end
