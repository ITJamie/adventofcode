require_relative '../../ruby_shared/inputs.rb'
require_relative 'funcs.rb'
require 'awesome_print'

raw = cleanup_line_group_by_blank_line_with_space(true) # comes from ruby_shared


ap calc_yes_count(raw)

