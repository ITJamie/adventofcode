def char_counter(string)
    chars_raw = string.split(//)
    chars_count = {}
    chars_raw.each do |char|
        unless char == " "
            if chars_count.key?(char)
                chars_count[char] +=1
            else
                chars_count[char] = 1
            end
        end
    end
    chars_count
end

def calc_yes_groups(groups)
    groups_out = []
    groups.each do |group_resp|
    groups_out.append( char_counter(group_resp).count )
    end
    groups_out
end

def calc_yes_count(groups)
    groups_out = calc_yes_groups(groups)
    return groups_out.inject(0){|sum,x| sum + x }
end