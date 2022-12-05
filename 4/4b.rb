#!/usr/bin/env ruby
def parse_range_string(range_string)
    range_start, range_end  = range_string.split('-')
    return (range_start.to_i..range_end.to_i)
end
def parse_line(pair)
    range_string_1,range_string_2 = pair.split(',')
end

if __FILE__ == $0
    file=File.open('pairs.txt')
    sum = 0
    file.readlines.each do |line|
      range_string1, range_string2 = parse_line(line)
      range1 = parse_range_string(range_string1)
      range2 = parse_range_string(range_string2)
      max_length = range1.to_a.length+range2.to_a.length
      union = range1.to_a.|(range2.to_a)
      union_length = union.length
      sum += 1 if max_length > union_length
    end

    puts sum
end