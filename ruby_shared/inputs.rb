def get_input(test=false)
    filename =  if test
                    'input_test.txt'
                else
                    'input.txt'
                end
    return File.open(filename).readlines.map(&:chomp)
end